import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';

class AuthLabel extends StatelessWidget {
  const AuthLabel(this.label, {Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
        color: PrimaryColors().blueGray90003,
      ),
    );
  }
}
