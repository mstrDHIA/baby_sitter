import 'package:babysitter_v1/src/core/constant/app_font.dart';
import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.isSecondary,
    this.disabled,
    this.loading,
  });

  final String name;
  final VoidCallback onPressed;
  final bool? isSecondary, disabled, loading;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled == null || disabled == false ? 1 : 0.5,
      child: IgnorePointer(
        ignoring: disabled == null || disabled == false ? false : true,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSecondary == null || isSecondary == false
                ? AppColor.red800
                : AppColor.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            minimumSize: Size(MediaQuery.sizeOf(context).width, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: loading == null || loading == false
              ? Text(
                  name,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFont.poppins,
                    color: AppColor.white,
                  ),
                )
              : const SizedBox(
                  width: 21,
                  height: 21,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.white),
                  ),
                ),
        ),
      ),
    );
  }
}
