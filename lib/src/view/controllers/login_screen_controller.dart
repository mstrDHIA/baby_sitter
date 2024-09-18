import 'dart:developer';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/constant/enums.dart';
import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_list_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/home_page_screen.dart';
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
  //void onInit() {
    //super.onInit();
   // espaceRole = Get.arguments['espace_role'];
   // log("espaceRole: $espaceRole");
 // }

  @override
  void onClose() {
    // emailController.dispose();
    // passwordController.dispose();
    super.onClose();
  }

  void handleShowPassword() {
    isShowPassword = !isShowPassword;
    update(); // Ensure the UI is updated
  }

  void handleRememberMe() {
    isRememberMe = !isRememberMe;
    update(); // Ensure the UI is updated
  }

  Future<void> signInWithEmailPassword() async {
    if (!formKey.currentState!.validate()) {
      showSnackbar(
        Get.context!,
        message: "Please enter valid email and password",
        isError: true,
      );
      return;
    }
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final AuthResponse res = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);
          // print('signin'+res.toString());

      if (res.user == null) {
        throw Exception('Login failed');
      }
      // print('user id: '+res.user!.id);
      // Store the user ID
      appCache.setUid(res.user!.id);

      // Fetch the user role and name
      final dataRoleResponse = await Supabase.instance.client
          .from(AppDB.user)
          .select()
          .eq("id", res.user!.id)
          .maybeSingle();
      // print('got user');
      if (dataRoleResponse != null && dataRoleResponse.isNotEmpty) {
        String Role = dataRoleResponse['role'];
        // print('got role $Role');
        // String nom = dataRoleResponse['name'];

        // Store the role in cache
        appCache.setRole(Role);

        // log("Role: $Role, Nom: $nom");

        // Navigate based on the user role

        if (Role == role.babySitter.name) {
          // AppCache.instance.setUid(res.user!.id);
          Get.offAll(ProfileScreen());
        }
        //  else if (role == Role.admin.name) {
        //   Get.toNamed(AppRoute.adminHome);  
        // } 
        else if (Role == 'parent') {
          Get.offAll(BabysitterListScreen());  
        }
        // else if (role == Role.doctor.name) {
        //   Get.toNamed(AppRoute.doctorProfile);  
        // } else if (role == Role.creche.name) {
        //   Get.toNamed(AppRoute.crecheHome);  
        // }
         else {
          showSnackbar(
            Get.context!,
            message: "Invalid role",
            isError: true,
          );
        }
        // print('done');
      } else {
        showSnackbar(
          Get.context!,
          message: "Role information not found",
          isError: true,
        );
      }
    } catch (error) {
      // print('catch this');
      showSnackbar(
        Get.context!,
        message: "Connection Error: $error",
        isError: true,
      );
    }
  }

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        print('Google User: ${googleUser.email}');
        // Add your logic to handle Google sign-in
      } else {
        print('Sign in with Google canceled by user.');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }
}
