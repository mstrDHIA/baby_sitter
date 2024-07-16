import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController dateController=TextEditingController();

  var gender = ''.obs;
  var isLoading = false.obs;
  var isShowPassword = false.obs;

  void handleShowPassword() {
    isShowPassword.value = !isShowPassword.value;
  }

  void register() {
    if (formKey.currentState!.validate()) {
      // Implement registration logic here
      isLoading.value = true;
      // Simulate a delay for the loading state
      Future.delayed(Duration(seconds: 2), () {
        isLoading.value = false;
        // Navigate to the next screen or show a success message
        Get.toNamed('/someRoute');
      });
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}


/*class BabysitterSignupController extends GetxController {
  var gender = ''.obs;
  var name = ''.obs;
  var surname = ''.obs;
  var birthDate = ''.obs;
  var phoneNumber = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  void setGender(String value) {
    gender.value = value;
  }

  void setName(String value) {
    name.value = value;
  }

  void setSurname(String value) {
    surname.value = value;
  }

  void setBirthDate(String value) {
    birthDate.value = value;
  }

  void setPhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  void register() {
    if (password.value != confirmPassword.value) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    // Implémenter la logique d'inscription ici.
    Get.snackbar('Success', 'Registration successful');
  }
}*/
