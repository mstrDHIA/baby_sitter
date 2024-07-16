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

  RxBool isLoading = false.obs;
  RxBool isShowPassword = false.obs;
  RxBool isShowConfirmPassword = false.obs;
  RxBool isRememberMe = false.obs;
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
    isShowPassword.value = !isShowPassword.value;
  }

  void handleShowConfirmPassword() {
    isShowConfirmPassword.value = !isShowConfirmPassword.value;
  }

  void handleRememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  void register() {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        signUpWithEmailPassword();
      } else {
        showSnackbar(
          context: Get.context!,
          message: "Les mots de passe ne correspondent pas",
          isError: true,
        );
      }
    } else {
      showSnackbar(
        context: Get.context!,
        message: "Veuillez remplir tous les champs correctement",
        isError: true,
      );
    }
  }

  Future<void> signUpWithEmailPassword() async {
    isLoading.value = true;
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (res.user != null) {
        // Set user ID and role in cache
        appCache.setUid("${res.user!.id}");
        appCache.setRole("user");

        // Additional registration logic, such as navigating to a different page
        // Get.offAll(() => SomeScreen());

        // Insert additional user information into the database
        await supabase.from('user').insert({
          'id': res.user!.id,
          'name': nameController.text.trim(),
          'first_name': firstNameController.text.trim(),
          'Role': 'user',
          'is_complete_profil': false,
          'is_verified': false,
        });

      } else {
        showSnackbar(
          context: Get.context!,
          message: "Registration failed. Please try again.",
          isError: true,
        );
      }
    } catch (error) {
      print('Erreur de registration: $error');
      showSnackbar(
        context: Get.context!,
        message: "Une erreur s'est produite lors de l'enregistrement",
        isError: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
