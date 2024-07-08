import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/core/cache/app_cache.dart';
import 'dart:developer';
import 'package:babysitter_v1/src/view/screens/espacescreen/babysitter/babysitter_screen.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
class EspaceController extends GetxController {
  final RxString userRole = ''.obs;
  final RxBool isCompleteProfile = false.obs;
  final RxBool isVerified = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (AppCache().getUid() != "") {
        userRole.value = AppCache().getRole();
        isCompleteProfile.value = AppCache().getIsCompleteProfile();
        isVerified.value = AppCache().getIsVerified();
        navigateBasedOnRole();
      }
    });
  }

  void navigateBasedOnRole() {
    switch (userRole.value) {
      case 'babySitter':
        Get.off(AjoutBabysitterScreen());
        break;
      case 'docteur':
        if (isVerified.value && isCompleteProfile.value) {
          //Get.off(ProfileDoctoraScreen());
        } else if (!isVerified.value && isCompleteProfile.value) {
         // Get.off(LoadingScreen());
        } else {
         // Get.off(AjoutPhotodocScreen());
        }
        break;
      case 'parent':
       // Get.off(RegisterParent1ScreenScreen());
        break;
      case 'creche':
        if (isVerified.value && isCompleteProfile.value) {
         // Get.off(HomepageCrecheScreen());
        } else if (!isVerified.value && isCompleteProfile.value) {
         // Get.off(LoadingScreen());
        } else {
         // Get.off(AjoutphcrecheScreen());
        }
        break;
      case 'admin':
        if (isCompleteProfile.value) {
          //Get.off(HomePageAdminScreen());
        } else {
          //Get.off(RegisterAdminPhAScreen());
        }
        break;
      default:
        break;
    }
  }

  void goToLoginScreen(String id) {
    Get.toNamed(AppRoute.login, arguments: {"espace_role": id});
  }
}
