import 'package:babysitter_v1/src/core/constant/app_image.dart';
import '../model/onboard/onboarding_model.dart';

List<OnboardingModel> onboardedList = const [
  OnboardingModel(
    title: "Baby-sitter",
    description:
        "Carde vos enfants chez vous. Ils vous secondent pendant vos absences.",
    image: AppImage.onboard1,
  ),
  OnboardingModel(
    title: "Healthcare Baby",
    description:
        "Les enfants nécessitent une attention particulière afin de jouir du meilleur état de santé.",
    image: AppImage.onboard2,
  ),
  OnboardingModel(
    title: "Baby store",
    description: "Les produits enfant peuvent être utilisés dès la naissance.",
    image: AppImage.onboard3,
  ),
];
