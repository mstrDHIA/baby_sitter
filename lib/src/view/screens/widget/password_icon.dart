import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';

class PasswordIcon extends StatelessWidget {
  const PasswordIcon({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: PrimaryColors().blueGray300, size: 20),
    );
  }
}