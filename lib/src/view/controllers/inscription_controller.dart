import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        await signUpWithEmailPassword();
      } else {
        showSnackbar(
          Get.context!,
          message: "Les mots de passe ne correspondent pas",
          isError: true,
        );
      }
    } else {
      showSnackbar(
        Get.context!,
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
      final String fullName = "${firstNameController.text.trim()} ${nameController.text.trim()}";

      final AuthResponse res = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': fullName,
          'role': 'user',
          'is_complete_profil': false,
          'is_verified': false,
        },
      );

      if (res.user != null) {
        appCache.setUid(res.user!.id);
        appCache.setRole("user");

        await Supabase.instance.client.from('user').insert({
          'id': res.user!.id,
          'name': nameController.text.trim(),
          'first_name': firstNameController.text.trim(),
          'role': 'user',
          'is_complete_profil': false,
          'is_verified': false,
        });

        Get.offAllNamed('/some-screen');

        showSnackbar(
          Get.context!,
          message: "Inscription réussie! Bienvenue ${nameController.text.trim()}",
        );
      } else {
        showSnackbar(
          Get.context!,
          message: "L'inscription a échoué. Veuillez réessayer.",
          isError: true,
        );
      }
    } catch (error) {
      print('Erreur d\'inscription: $error');
      showSnackbar(
        Get.context!,
        message: "Une erreur s'est produite lors de l'enregistrement",
        isError: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
