import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/authentification/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_cache.dart';
import '../../../data/datasource/onboard.dart';

class OnboardingController extends GetxController {
  int _currentPage = 0;
  final PageController _pageController = PageController();
   final AppCache appCache = AppCache.instance;



   static OnboardingController get to => Get.find();


  bool get isFirstOpen => !appCache.getOnboarded();

  // Getter
  PageController get pageController => _pageController;
  int get currentPage => _currentPage;

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }

  bool isLastPage() => _currentPage == onboardedList.length - 1;

  void skipPage() {
    _pageController.animateToPage(
      onboardedList.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _currentPage++;
    update();
  }
/*void navigateToPage() {
  if (!isLastPage()) {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  } else {
    Get.offAllNamed(AppRoute.login);
    appCache.setOnboarded(true);
  }
}*/

      void navigateToPage() {
    if (!isLastPage()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.offAll(LoginScreen());
      appCache.setOnboarded(true);
    }
  }

  void handlePage(int index) {
    _currentPage = index;
    update();
  }
}