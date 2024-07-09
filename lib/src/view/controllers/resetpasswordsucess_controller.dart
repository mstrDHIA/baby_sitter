
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:get/get.dart';

class ResetPasswordSuccessController extends GetxController {
  void goToLogin() {
     Get.toNamed(AppRoute.login);
  }
}
