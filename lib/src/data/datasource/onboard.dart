import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import'package:babysitter_v1/src/view/screens/onboarding/onboarding_screen.dart';


List<OnboardingModel> onboardedList = [
  OnboardingModel(
    title: "Baby-sitter",
    description: "Carde vos enfants chez vous. Ils vous secondent pendant vos absences.",
    image: AppImage.onboard1,
    titleStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
     descriptionStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
  ),
  OnboardingModel(
    title: "Healthcare Baby",
    description: "Les enfants nécessitent une attention particulière afin de jouir du meilleur état de santé.",
    image: AppImage.onboard2,
    titleStyle: 
    TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    descriptionStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
    
  ),
  OnboardingModel(
    title: "Baby store",
    description: "Les produits enfant peuvent être utilisés dès la naissance.",
    image: AppImage.onboard3,
   titleStyle: 
    TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    descriptionStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
  ),
];
