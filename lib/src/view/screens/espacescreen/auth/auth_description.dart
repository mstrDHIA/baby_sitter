import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/utils/size_utils.dart';
import'package:babysitter_v1/src/view/screens/widget/custom_text_style.dart';


class AuthDescription extends StatelessWidget {
  const AuthDescription(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.h),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: CustomTextStyles.labelLargeMedium.copyWith(height: 1.72),
      ),
    );
  }
}
