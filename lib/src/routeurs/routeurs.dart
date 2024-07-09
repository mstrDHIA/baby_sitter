import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/view/screens/onboarding/onboarding_screen.dart';
import 'package:babysitter_v1/src/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/space/babysitter/babysitter_screen.dart';
import '../view/screens/space/espace_screen.dart';
import'package:babysitter_v1/src//view/screens/authentification/login_screen.dart';
import'package:babysitter_v1/src/view/screens/space/inscription_screen.dart';
import'package:babysitter_v1/src/view/screens/space/forgetpage_screen.dart';
import'package:babysitter_v1/src/view/screens/space/forgetpage2_screen.dart';
import'package:babysitter_v1/src/view/screens/space/verificationNum_screen.dart';

List<GetPage<dynamic>>? routers = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.onboarding, page: () => const OnboardingScreen()),
  GetPage(name: AppRoute.espace, page: () => const EspaceScreen()),
  GetPage(name: AppRoute.babysitter, page: () => const AjoutBabysitterScreen()),
    GetPage(name: AppRoute.login, page: () => const LoginScreen ()),
    GetPage(name:AppRoute. inscription,page:()=>const RegisterScreen()),
    GetPage(name:AppRoute. forget,page:()=>const ForgetPasswordScreen()),
    GetPage(name:AppRoute. forget2,page:()=>const ForgetScreen()),
    GetPage(name: AppRoute.verification, page: () => VerificationScreen(phoneNumber: '')),
];
