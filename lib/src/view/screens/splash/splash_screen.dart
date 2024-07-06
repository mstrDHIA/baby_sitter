import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_font.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/src/shared/spacer/vertical_spacer.dart';
import 'package:babysitter_v1/src/view/controllers/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(AppImage.logo, width: 150, height: 150),
          ),
          const VerticalSpacer(2),
          Text(
            "Caring for little smiles!",
            style: Get.textTheme.displaySmall!.copyWith(
                fontSize: 25, fontFamily: AppFont.itim, color: AppColor.white),
          )
        ],
      ),
    );
  }
}
