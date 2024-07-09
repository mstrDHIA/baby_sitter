import 'package:get/get.dart';
import 'package:flutter/material.dart';


class VerificationController extends GetxController {
  var isLoading = false;
  var countdown = 60;
  TextEditingController codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    if (countdown > 0) {
      Future.delayed(Duration(seconds: 1), () {
        countdown--;
        update(); // Notify listeners to update the UI
        if (countdown > 0) {
          startCountdown();
        }
      });
    }
  }

  void resendCode() {
    countdown = 60;
    update();
    startCountdown();
    // Ajoutez ici la logique pour renvoyer le code
  }

  void verifyCode() {
    if (formKey.currentState?.validate() ?? false) {
      isLoading = true;
      update(); // Notify listeners to update the UI
      // Simule une requête réseau ou une opération asynchrone
      Future.delayed(Duration(seconds: 2), () {
        isLoading = false;
        update(); // Notify listeners to update the UI
        // Supposons que le code est vérifié avec succès
        //Get.toNamed(AppRoute.nextScreen); // Redirige vers l'écran suivant
      });
    }
  }
}
