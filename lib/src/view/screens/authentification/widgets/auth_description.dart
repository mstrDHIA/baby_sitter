import 'package:babysitter_v1/src/core/constant/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthDescription extends StatelessWidget {
  const AuthDescription(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Text(text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodyMedium!.copyWith(
            //  fontSize: 12,
            fontFamily: AppFont.futuraPT,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
