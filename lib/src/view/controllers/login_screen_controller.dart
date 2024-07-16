import 'dart:developer';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/constant/enums.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isShowPassword = false;
  bool isRememberMe = false;
  final AppCache appCache = AppCache.instance;

  late String espaceRole;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
    espaceRole = Get.arguments['espace_role'];
    log("espaceRole: $espaceRole");
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void handleShowPassword() {
    isShowPassword = !isShowPassword;
  }

  void handleRememberMe() {
    isRememberMe = !isRememberMe;
  }

  Future<void> signInWithEmailPassword() async {
    if (!formKey.currentState!.validate()) {
      showSnackbar(
          context: Get.context!,
          message: "Please enter valid email and password",
          isError: true);
      return;
    }

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final AuthResponse res = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);

      if (res.user == null) {
        throw Exception('Login failed');
      }

      appCache.setUid("${res.user!.id}");
      final dataRoleResponse = await Supabase.instance.client
          .from(AppDB.user)
          .select("role, nom")
          .eq("id", res.user!.id)
          .maybeSingle();

      if (dataRoleResponse != null && dataRoleResponse.isNotEmpty) {
        String role = dataRoleResponse['role'];
        String nom = dataRoleResponse['nom'];

        appCache.setRole(role);

        log("Role: $role, Nom: $nom");

        if (role == Role.babySitter.name) {
          Get.toNamed(AppRoute.espace);
        } else if (role == Role.admin.name) {
          // Redirection pour le rôle admin
          // Get.toNamed(AppRoute.adminHome);
        } else if (role == Role.parent.name) {
          // Redirection pour le rôle parent
          // Get.toNamed(AppRoute.registerParent);
        } else if (role == Role.doctor.name) {
          // Redirection pour le rôle doctor
          // Get.toNamed(AppRoute.doctorProfile);
        } else if (role == Role.creche.name) {
          // Redirection pour le rôle creche
          // Get.toNamed(AppRoute.crecheHome);
        }
      } else {
        showSnackbar(
            context: Get.context!,
            message: "Role information not found",
            isError: true);
      }
    } catch (error) {
      showSnackbar(
          context: Get.context!,
          message: "Connection Error: $error",
          isError: true);
    }
  }

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        print('Google User: ${googleUser.email}');
      } else {
        print('Sign in with Google canceled by user.');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }
}
