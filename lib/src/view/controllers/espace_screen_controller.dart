import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'dart:developer';
import 'package:babysitter_v1/src/core/constant/app_route.dart';

class EspaceController extends GetxController {
  final RxString userRole = ''.obs;
  final RxBool isCompleteProfile = false.obs;
  final RxBool isVerified = false.obs;
  final AppCache appCache = AppCache.instance;
  

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (appCache.getUid() != "") { 
        userRole.value = appCache.getRole(); 
        isCompleteProfile.value = appCache.getIsCompleteProfile(); 
        isVerified.value = appCache.getIsVerified(); 
        navigateBasedOnRole();
      }
    });
  }

  void navigateBasedOnRole() {
    switch (userRole.value) {
      case 'babySitter':
        Get.to(() => AjoutBabysitterScreen());
        break;
      case 'docteur':
        if (isVerified.value && isCompleteProfile.value) {
          // Get.to(() => ProfileDoctoraScreen());
        } else if (!isVerified.value && isCompleteProfile.value) {
          // Get.to(() => LoadingScreen());
        } else {
          // Get.to(() => AjoutPhotodocScreen());
        }
        break;
      case 'parent':
        // Get.to(() => RegisterParent1ScreenScreen());
        break;
      case 'creche':
        if (isVerified.value && isCompleteProfile.value) {
          // Get.to(() => HomepageCrecheScreen());
        } else if (!isVerified.value && isCompleteProfile.value) {
          // Get.to(() => LoadingScreen());
        } else {
          // Get.to(() => AjoutphcrecheScreen());
        }
        break;
      case 'admin':
        if (isCompleteProfile.value) {
          // Get.to(() => HomePageAdminScreen());
        } else {
          // Get.to(() => RegisterAdminPhAScreen());
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
