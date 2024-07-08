import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/espace_screen.dart';
import 'package:babysitter_v1/src/core/cache/app_cache.dart';

import '../../../data/datasource/onboard.dart';

class OnboardingController extends GetxController {
  int _currentPage = 0;
  final PageController _pageController = PageController();

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
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _currentPage++;
    update();
  }

  void navigateToPage(BuildContext context) {
    if (_currentPage < onboardedList.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EspaceScreen()),
      );
      AppCache().setOnboarded(true);
    }
  }

  void handlePage(int index) {
    _currentPage = index;
    update();
  }
}
