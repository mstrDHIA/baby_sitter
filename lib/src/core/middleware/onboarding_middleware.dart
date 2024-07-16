import 'package:babysitter_v1/src/core/constant/app_cache.dart';
import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    bool isFirstOpen  = AppCache.instance.getOnboarded();   // final onboardingController = Get.put(OnboardingController());
    if (isFirstOpen) {
      return  RouteSettings(name: AppRoute.espace);
    } else {
      return null;
    }
  }
}
