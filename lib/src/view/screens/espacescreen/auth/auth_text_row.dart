import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';

class AuthTextRow extends StatelessWidget {
  const AuthTextRow({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.fontSize,
  }) : super(key: key);

  final String title, subTitle;
  final VoidCallback onTap;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: fontSize ?? 12,
                ),
              ),
              TextSpan(
                text: subTitle,
                style: TextStyle(
                    color: PrimaryColors().pink800,
                    fontSize: fontSize ?? 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
