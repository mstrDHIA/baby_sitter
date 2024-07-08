import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/view/screens/widget/custom_text_style.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';

class ButtonEspace extends StatelessWidget {
  const ButtonEspace({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text, style: CustomTextStyles.headlineSmallFuturaPTPrimary),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: PrimaryColors().pink200,
        foregroundColor: PrimaryColors().pink800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      ),
    );
  }
}
