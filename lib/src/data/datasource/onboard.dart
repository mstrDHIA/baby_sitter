import 'package:babysitter_v1/src/core/constant/app_image.dart';

import '../model/onboard/onboard.dart';

List<OnboardingModel> onboardedList = [
  OnboardingModel(
    title: "Baby-sitter",
    description:
        "Carde vos enfants chez vous. Ils vous secondent pendant vos absences.",
    image:AppImage.onboard1 ,
  ),
  OnboardingModel(
    title: "Healthcare Babby",
    description:
        "Les enfants nécessitent une attention particulière afin de jouir du meilleur état de santé.",
    image: AppImage.onboard2,
  ),
  OnboardingModel(
    title: "Baby store",
    description: "Les produits enfant peuvent être utilisés dés la naissance.",
    image:AppImage.onboard3 ,
  ),
];
