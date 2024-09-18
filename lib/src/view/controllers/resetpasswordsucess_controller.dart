
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/authentification/login_screen.dart';
import 'package:get/get.dart';

class ResetPasswordSuccessController extends GetxController {
  void goToLogin() {
     Get.to(LoginScreen());
  }
}
