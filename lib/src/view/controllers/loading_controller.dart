import 'package:babysitter_v1/main.dart';
import 'package:babysitter_v1/src/core/constant/appDB.dart';
import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/authentification/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoadingController extends GetxController {
  var isVerified = false.obs;

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  Future<void> getUserInfo() async {
    try {
      var response = await supabase
          .from(AppDB.user)
          .select("is_verified")
          .eq("id", AppCache.instance.getUid());
      isVerified.value = response[0]["is_verified"];
    } catch (e) {
      debugPrint("Error [LOADING SCREEN]: $e");
    }
  }

 /* void handleClick() {
    if (isVerified.value) {
      Get.off(() => HomepageCrecheScreen());
      AppCache.instance.setVerified(true);
    } else {
      Get.off(() => DetailBabySitterSreen());
      AppCache.instance.setVerified(true);
    }
    logout();
  }*/

  void logout() async {
    // await supabase.auth.signOut();
    // String role = AppCache.instance.getRole();
    AppCache.instance.clear();
    Get.offAll(LoginScreen(), 
    // arguments: {"espace_role": role}
    );
  }
}
