import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/authentification/login_screen.dart';
import 'package:babysitter_v1/src/view/screens/onboarding/onboarding_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_list_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/home_page_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    if(AppCache.instance.getUid()!=null&&AppCache.instance.getUid()!=''&&AppCache.instance.getUid().isNotEmpty){
      String role=AppCache.instance.getRole();
      if(role=='parent'){
        Future.delayed(
        const Duration(seconds: 2), () => Get.off(BabysitterListScreen()));
      }
      else{
        Future.delayed(
        const Duration(seconds: 2), () => Get.off(ProfileScreen()));
      }
    }
    else{
      Future.delayed(
        const Duration(seconds: 2), () => Get.off(LoginScreen()));
    }
    
       
    super.onInit();
  }
}
