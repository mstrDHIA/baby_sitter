import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/onboarding/onboarding_screen.dart';
import 'package:babysitter_v1/src/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import'package:babysitter_v1/src/view/screens/espacescreen/espace_screen.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/babysitter/babysitter_screen.dart';
import 'package:babysitter_v1/src/view/screens/espacescreen/loginscreen/login_screen.dart';

List<GetPage<dynamic>>? routers = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.onboarding, page: () => const OnboardingScreen ()),
   GetPage(name: AppRoute.espace, page: () =>  EspaceScreen()),
   //GetPage(name: AppRoute. babysitter_screen, page: () =>  AjoutBabysitterScreen()),
   GetPage(name: AppRoute.login, page: () => LoginScreen()),

];
