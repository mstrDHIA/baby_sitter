import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:babysitter_v1/src/view/screens/space/verificationNum_screen.dart';

class ForgetController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var phoneNumber = PhoneNumber(isoCode: 'TN').obs;
  var isPhoneNumberValid = false.obs;

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Numéro de téléphone requis';
    }
    return null;
  }

 /* void sendResetPasswordSMS() async {
    if (formKey.currentState!.validate() && isPhoneNumberValid.value) {
      isLoading.value = true;
      try {
        // Call the API to send the reset password SMS
        // Replace with your API call
        await Future.delayed(const Duration(seconds: 2));
        Get.snackbar('Success', 'SMS de réinitialisation envoyé');
        if (phoneNumber.value.phoneNumber != null) {
          Get.to(() => VerificationScreen(phoneNumber: phoneNumber.value.phoneNumber!));
        } else {
          Get.snackbar('Error', 'Numéro de téléphone invalide');
        }
      } catch (e) {
        Get.snackbar('Error', 'Erreur lors de l\'envoi du SMS');
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar('Error', 'Numéro de téléphone invalide');
    }
  }*/

  void onPhoneNumberChanged(PhoneNumber number) {
    phoneNumber.value = number;
  }

  void onPhoneNumberValidated(bool value) {
    isPhoneNumberValid.value = value;
  }
}
