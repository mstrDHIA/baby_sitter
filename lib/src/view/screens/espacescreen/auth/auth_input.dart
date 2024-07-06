
import 'package:flutter/material.dart';


import 'package:babysitter_v1/src/core/constant/app_color.dart';

class AuthInput extends StatelessWidget {
  const AuthInput(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.suffix,
      this.keyboardType,
      this.validator,
      this.obscure,
      this.readOnly,
      this.maxLines,
      this.isSecond})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool? obscure;
  final bool? readOnly;
  final int? maxLines;
  final bool? isSecond;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscure ?? false,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
        color: PrimaryColors().blueGray90003,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
          color: PrimaryColors().blueGray300,
        ),
        errorStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins",
          color: PrimaryColors().red400,
        ),
        contentPadding:
            EdgeInsets.all(isSecond == null || isSecond == false ? 17 : 12),
        fillColor: isSecond == null || isSecond == false
            ? PrimaryColors().whiteA700
            : Colors.grey[200],
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              isSecond == null || isSecond == false ? 10 : 5),
          borderSide: BorderSide(color: PrimaryColors().blueGray10001),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              isSecond == null || isSecond == false ? 10 : 5),
          borderSide: BorderSide(color: PrimaryColors().blueGray10001),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              isSecond == null || isSecond == false ? 10 : 5),
          borderSide: BorderSide(color: PrimaryColors().blueGray300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              isSecond == null || isSecond == false ? 10 : 5),
          borderSide: BorderSide(color: PrimaryColors().red400, width: 1),
        ),
        suffixIcon: suffix ?? SizedBox(),
      ),
    );
  }
}
