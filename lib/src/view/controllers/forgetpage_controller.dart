import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  void sendResetPasswordEmail() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter your email',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading(true);

    try {
      // Add your password reset logic here
      // For example, using Supabase:
      // final response = await Supabase.instance.client.auth.api.resetPasswordForEmail(email);
      // if (response.error != null) {
      //   Get.snackbar('Error', response.error.message,
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      // } else {
      //   Get.snackbar('Success', 'Password reset email sent!',
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      // }

      Get.snackbar('Success', 'Password reset email sent!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }
}
