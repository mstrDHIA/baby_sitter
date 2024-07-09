import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../main.dart';
import '../../core/constant/app_cache.dart';
import '../../core/functions/show_snack_bar.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  bool isRememberMe = false;
  final AppCache appCache = AppCache.instance;

  @override
  void dispose() {
    nameController.dispose();
    firstNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void handleShowPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  void handleShowConfirmPassword() {
    isShowConfirmPassword = !isShowConfirmPassword;
    update();
  }

  void handleRememberMe() {
    isRememberMe = !isRememberMe;
    update();
  }

  void register() {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        signUpWithEmailPassword();
      } else {
        showSnackbar(
          context: Get.context!,
          message: "Passwords do not match",
          isError: true,
        );
      }
    } else {
      showSnackbar(
        context: Get.context!,
        message: "Please fill in all fields correctly",
        isError: true,
      );
    }
  }

  Future<void> signUpWithEmailPassword() async {
    isLoading = true;
    update();
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      appCache.setUid("${res.user?.id}");
      appCache.setRole("user");

      // Add additional logic as needed after registration

    } catch (error) {
      isLoading = false;
      update();
      print('Erreur de registration: $error');
      showSnackbar(
        context: Get.context!,
        message: "An error occurred during registration",
        isError: true,
      );
    } finally {
      isLoading = false;
      update();
    }
  }
}
