import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:babysitter_v1/src/core/constant/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonEspace extends StatelessWidget {
  const ButtonEspace({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.pink200,
        foregroundColor: AppColor.pink800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(17),
      ),
      child: Text(
        text,
        style: Get.textTheme.bodyLarge!.copyWith(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: AppFont.futuraPT,
        ),
      ),
    );
  }
}
