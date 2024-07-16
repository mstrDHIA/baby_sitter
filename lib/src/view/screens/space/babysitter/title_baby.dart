import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:flutter/material.dart';


class TitleBabyIdentity extends StatelessWidget {
  const TitleBabyIdentity(
      {Key? key,
      required this.title,
      this.fontSize,
      this.color,
      this.fontWeight})
      : super(key: key);

  final String title;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color ?? AppColor.blueGray255,
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
    );
  }
}
