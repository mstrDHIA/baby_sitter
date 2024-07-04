import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/onboard.dart';

class OnboardingController extends GetxController {
 int _currentPage = 0;
  final PageController _pageController = PageController();

  // Getter
  PageController get pageController => _pageController;
  int get currentPage=> _currentPage;

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }
  

  skipPage() {
    _pageController.animateToPage(
      onboardedList.length - 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
      _currentPage++;
    update(

    );
  
  }
   
    void navigateToPage(int index,) {
    _currentPage = index;
    update();
  }
}

  

  