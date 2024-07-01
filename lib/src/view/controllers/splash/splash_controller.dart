import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
        const Duration(seconds: 2), () => Get.offNamed(AppRoute.onboarding));
    super.onInit();
  }
}
