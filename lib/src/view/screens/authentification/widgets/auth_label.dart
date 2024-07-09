import 'package:babysitter_v1/src/core/constant/app_font.dart';
import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';

class AuthLabel extends StatelessWidget {
  const AuthLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: AppFont.poppins,
        color: AppColor.blueGray900,
      ),
    );
  }
}
