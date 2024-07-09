import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ResetPasswordController extends GetxController {
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isShowNewPassword = false.obs;
  var isShowConfirmPassword = false.obs;
  var isLoading = false.obs;

  void handleShowNewPassword() {
    isShowNewPassword.value = !isShowNewPassword.value;
  }

  void handleShowConfirmPassword() {
    isShowConfirmPassword.value = !isShowConfirmPassword.value;
  }

  bool validatePasswords() {
    return newPasswordController.text == confirmPasswordController.text &&
           newPasswordController.text.isNotEmpty;
  }

  void resetPassword() {
    if (validatePasswords()) {
     
      Get.snackbar('Succès', 'Mot de passe réinitialisé avec succès.');
    } else {
      Get.snackbar('Erreur', 'Les mots de passe ne correspondent pas.');
    }
  }
}
