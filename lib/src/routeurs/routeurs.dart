import 'package:babysitter_v1/src/core/constant/app_route.dart';
import 'package:babysitter_v1/src/core/middleware/initial_middleware.dart';
import 'package:babysitter_v1/src/core/middleware/onboarding_middleware.dart';
import 'package:babysitter_v1/src/data/model/onboard/baby.dart';
import 'package:babysitter_v1/src/view/controllers/onboarding/onboarding_controller.dart';
import 'package:babysitter_v1/src/view/screens/chat/chat_screen.dart';
import 'package:babysitter_v1/src/view/screens/onboarding/onboarding_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/adresse_babysitter.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_list_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/babysitter_signup_view.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/description_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/home_page_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/horaire_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/identitebabysitter_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/profilbabysitter_p1_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/babysitter/tarif_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/loading_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/parent/description_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/resetpassword_screen.dart';
import 'package:babysitter_v1/src/view/screens/space/resetpasswordsucsses_view.dart';
import 'package:babysitter_v1/src/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/space/babysitter/babysitter_photo_screen.dart';
import '../view/screens/space/espace_screen.dart';
import'package:babysitter_v1/src//view/screens/authentification/login_screen.dart';
import'package:babysitter_v1/src/view/screens/space/inscription_screen.dart';
import'package:babysitter_v1/src/view/screens/space/forgetpage_screen.dart';
import'package:babysitter_v1/src/view/screens/space/forgetpage2_screen.dart';
import'package:babysitter_v1/src/view/screens/space/verificationNum_screen.dart';

List<GetPage<dynamic>>? routers = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen(),
 // middlewares: [OnBoardingMiddleware()],
 ),
  GetPage(
      name: AppRoute.onboarding,
      page: () => const OnboardingScreen(),
      middlewares: [OnBoardingMiddleware()],
       //binding: BindingsBuilder(() {
       // Get.put(OnboardingController());
      //}),
    ),
    GetPage(name: AppRoute.chat, page: () =>  BabysitterListScreen()),
  // GetPage(name: AppRoute.chat, page: () =>  ChatScreen()),
  GetPage(name: AppRoute.espace, page: () => const EspaceScreen()),
  GetPage(name: AppRoute.parentDescription, page: () =>  ParentDescriptionScreen()),
  GetPage(name: AppRoute.babysitter, page: () => const RegisterBabysitterScreen ()),
    GetPage(name: AppRoute.login, page: () => const LoginScreen ()),
   // GetPage(name:AppRoute. inscription,page:()=>const RegisterScreen()),
    GetPage(name:AppRoute. forget,page:()=>const ForgetPasswordScreen()),
    GetPage(name:AppRoute. forget2,page:()=>const ForgetScreen()),
    GetPage(name: AppRoute.verification, page: () => VerificationScreen(phoneNumber: '')),
    GetPage(name:AppRoute.reset,page:()=>ResetPasswordView()),
  GetPage(name:AppRoute.success,page:()=>ResetPasswordSuccessView()),
  GetPage(name:AppRoute.loading,page:()=>LoadingScreen()),
  GetPage(name:AppRoute.identitebabysitter,page:()=> IdentitBabySitterTapeTwoScreen()),
   GetPage(name:AppRoute.signup, page: ()=>RegisterView()),
   GetPage(name:AppRoute.babysitterphoto,page:()=>AjoutBabysitterPhotoScreen()),
   GetPage(name:AppRoute.adresse,page:()=>AdresseBabysitterScreen()),
   GetPage(name:AppRoute.description,page:()=>RegisterBabySitterEtapeOneScreen()),
   GetPage(name:AppRoute.cin,page:()=>IdentitBabySitterTapeTwoScreen()),
  // GetPage(name:AppRoute.horaire,page:()=>PlanificationBabySitterTapeThreeScreen()),
   GetPage(name:AppRoute.tarif,page:()=> TarifScreen()),
  GetPage(name:AppRoute.homePage,page:()=> ProfileScreen  ()),
 
];
