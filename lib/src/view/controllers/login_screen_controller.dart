import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:babysitter_v1/src/core/functions/show_snack_bar.dart';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import 'package:babysitter_v1/src/core/constant/enums.dart';
import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isShowPassword = false.obs;
  RxBool isRememberMe = false.obs;
  final AppCache appCache = AppCache.instance;

  late String espaceRole;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void onInit() {
    super.onInit();
    // Initialize args from Get.arguments
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
    isShowPassword.value = !isShowPassword.value;
  }

  void handleRememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  bool getIsVerified() => sharedPref!.getBool("VERIFIED") ?? false;

  void login() {
    if (formKey.currentState!.validate()) {
      signInWithEmailPassword();
    } else {
      showSnackbar(
          context: Get.context!,
          message: "Please enter valid email and password",
          isError: true);
    }
  }

  Future<void> signInWithEmailPassword() async {
    isLoading.value = true;
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final AuthResponse res = await supabase.auth
          .signInWithPassword(email: email, password: password);

      appCache.setUid("${res.session?.user.id}");
      final dataRole = await supabase
          .from(AppDB.user)
          .select("role,is_complete_profil,is_verified")
          .eq("id", "${res.session?.user.id}");
           // Ajout de .execute() pour exécuter la requête

      appCache.setRole("${dataRole[0]['role']}"); // Utilisation de .data pour accéder aux données
      appCache.setIsCompleteProfile(dataRole[0]['is_complete_profil']);
      appCache.setVerified(dataRole[0]['is_verified']);

      log("dataRole: ${dataRole[0]['role']}");

      bool isCompleteProfile = appCache.getIsCompleteProfile();
      bool isVerified = appCache.getIsVerified();
      if (role.babySitter.name == dataRole[0]['role']) {
        log("ajout babysitter");

        if (isVerified && isCompleteProfile) {
          // Utilisez Get.offAll(() => NomDeVotreEcran()) pour naviguer
          // Get.offAll(() => PlanificationenfantScreen());
        } else if (!isVerified && isCompleteProfile) {
          // Get.offAll(() => LoadingScreen());
        } else {
          // Get.offAll(() => IdentitBabySitterTapeTwoScreen());
        }
      } else if (role.admin.name == dataRole[0]['role']) {
        log("ajout admin");
        if (isCompleteProfile) {
         // Get.offAll(() => HomePageAdminScreen());
        } else {
         // Get.offAll(() => RegisterAdminPhAScreen());
        }
      } else if (role.parent.name == dataRole[0]['role']) {
        log("ajout parent");
       // Get.offAll(() => RegisterParent1ScreenScreen());
      } else if (role.docteur.name == dataRole[0]['role']) {
        log("docteur");

        if (isVerified && isCompleteProfile) {
         // Get.offAll(() => ProfileDoctoraScreen());
        } else if (!isVerified && isCompleteProfile) {
          // Get.offAll(() => LoadingScreen());
        } else {
         // Get.offAll(() => AjoutPhotodocScreen());
        }
      } else if (role.creche.name == dataRole[0]['role']) {
        log("creche");

        if (isVerified && isCompleteProfile) {
         // Get.offAll(() => HomepageCrecheScreen());
        } else if (!isVerified && isCompleteProfile) {
          // Get.offAll(() => LoadingScreen());
        } else {
         // Get.offAll(() => AjoutphcrecheScreen());
        }
      } else {}
    } catch (error) {
      isLoading.value = false;
      print('Erreur de connexion: $error');
      if (error.toString().contains("400")) {
        showSnackbar(
            context: Get.context!,
            message: "Email ou mot de passe incorrect",
            isError: true);
      } else {
        showSnackbar(context: Get.context!, message: "$error", isError: true);
      }
    } finally {
      isLoading.value = false;
    }
  }

  String? validEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
   void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Handle sign-in logic with your backend or other services
        print('Google User: ${googleUser.email}');
      } else {
        print('Sign in with Google canceled by user.');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      // Handle error
    }
  }
}

