import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/view/screens/space/espace_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
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
  final TextEditingController dateController = TextEditingController();

  var gender = ''.obs;
  var isLoading = false.obs;
  var isShowPassword = false.obs;
    var isButtonClicked = false.obs;

  final SupabaseClient supabase = Supabase.instance.client;

  void handleShowPassword() {
    isShowPassword.value = !isShowPassword.value;
  }
  /*Future<bool> register() async {
  if (!formKey.currentState!.validate()) {
    return false;
  }

  isLoading.value = true;

  // Sign up with Supabase
  final authResponse = await supabase.auth.signUp(
    email: emailController.text,
    password: passwordController.text,
  );

  // Ensure authResponse.user is not null before proceeding
  if (authResponse.user != null) {
    // Insert additional user details into the `user` table
    final userDetailsResponse = await supabase.from('user').insert({
      'id': authResponse.user!.id,
      'first_name': nameController.text,
      'last_name': surnameController.text,
      'date_of_birth': dateController.text,
      'phone_number': phoneController.text,
      'gender': gender.value,
    });

    // Proceed based on whether userDetailsResponse has data or not
    if (userDetailsResponse.data != null) {
      // If insertion is successful, navigate to the next page
     
      isLoading.value = false;
      return true;
    } else {
      // Handle case where insertion did not succeed
      Get.snackbar('Error', 'Failed to save user details.');
      isLoading.value = false;
      return false;
    }
  } else {
    // Handle case where sign-up did not succeed
    Get.snackbar('Error', 'Failed to register.');
    isLoading.value = false;
    return false;
  }
}*/

void register() async {
  if (formKey.currentState!.validate()) {
    isLoading.value = true;

    try {
      // Sign up with Supabase
      final response = await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
       isButtonClicked.value = true;
      // Check if the user is null to handle errors
      if (response.user == null) {
        Get.snackbar('Error', 'Failed to register: No user returned from the sign-up.');
        return;
      }

      // Insert additional user details into the `user` table
      final insertResponse = await supabase.from('user').insert({
        'id': response.user!.id,
        'password':passwordController.text,
        'email':emailController.text,
        'first_name': nameController.text,
        'last_name': surnameController.text,
        'date_of_birth': dateController.text,
        'phone_number': phoneController.text,
        'gender': gender.value,
      }).select().single(); // Ensure to call execute() to perform the operation
      print(insertResponse);
      print(insertResponse.isEmpty);
      if ((insertResponse.isNull)||(insertResponse.isEmpty)) {
        // Print detailed error message to console for debugging
        print('Insertion error: couldn\'t add user');
        Get.snackbar('Error', 'Failed to save user details: Couldn\'nt add user details to database');
        return;
      }
      else{
        print(insertResponse['id']);
        AppCache.instance.setUid(insertResponse['id']);
        Get.off(EspaceScreen());
      }

      // If insertion is successful, navigate to the next page
      // Get.toNamed(AppRoute.horaire);
    } catch (e) {
      // Print exception details to console for debugging
      print('Exception occurred: $e');
      Get.snackbar('Error', 'An exception occurred: $e');
    } finally {
      isLoading.value = false;
    }
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
    dateController.dispose();
    super.onClose();
  }
}
