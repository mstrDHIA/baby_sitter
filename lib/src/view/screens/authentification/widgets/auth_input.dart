import 'package:flutter/material.dart';

import 'package:babysitter_v1/src/core/constant/app_color.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffix,
    this.keyboardType,
    this.validator,
    this.obscure,
    this.readOnly,
    this.maxLines,
    this.isSecond,
    
  });

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
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
        color: AppColor.blueGray900,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
          color: AppColor.blueGray300,
        ),
        errorStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins",
          color: AppColor.red400,
        ),
        contentPadding:
            EdgeInsets.all(isSecond == null || isSecond == false ? 17 : 12),
        fillColor: isSecond == null || isSecond == false
            ? AppColor.white
            : Colors.grey[200],
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              isSecond == null || isSecond == false ? 10 : 5),
          borderSide: const BorderSide(color: AppColor.blueGray100),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              isSecond == null || isSecond == false ? 10 : 5),
          borderSide: const BorderSide(color: AppColor.blueGray100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              isSecond == null || isSecond == false ? 10 : 5),
          borderSide: const BorderSide(color: AppColor.blueGray100),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              isSecond == null || isSecond == false ? 10 : 5),
          borderSide: const BorderSide(color: AppColor.red400, width: 1),
        ),
        suffixIcon: suffix ?? const SizedBox(),
      ),
    );
  }
}
