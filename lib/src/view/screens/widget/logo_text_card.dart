import 'package:babysitter_v1/src/core/constant/app_font.dart';
import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogoTextCard extends StatelessWidget {
  const LogoTextCard({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImage.logo, height: 60, width: 60),
        const SizedBox(height: 15),
        Text(
          text ?? "Prendre soin des petits sourires !",
          style: Get.textTheme.bodyLarge!.copyWith(
            color: AppColor.red400,
            fontFamily: AppFont.futuraPT,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
