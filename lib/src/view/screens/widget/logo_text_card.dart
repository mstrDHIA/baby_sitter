import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_image.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';


class LogoTextCard extends StatelessWidget {
  const LogoTextCard({Key? key, this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImageView(
            imagePath: AppImage.imgSettings, height: 60, width: 60),
        SizedBox(height: 15),
        Text(
          text ?? "Prendre soin des petits sourires !",
          style: TextStyle(
            color: PrimaryColors().redA200,
            fontFamily: "Futura PT",
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
