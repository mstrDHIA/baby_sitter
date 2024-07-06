import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final bool? isDisabled;
  final Alignment? alignment;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final String text;
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? label;

  const CustomTextButton({
    super.key,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.alignment,
    this.height,
    this.width,
    this.margin,
    required this.text,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = Container(
      height: height ?? 36.0,
      width: width ?? double.infinity,
      margin: margin,
      decoration: decoration,
      child: TextButton(
        style: buttonStyle ??
            TextButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              textStyle: buttonTextStyle ??
                  const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
        onPressed: isDisabled ?? false ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            Text(
              text,
              style: buttonTextStyle ??
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );

    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: button,
          )
        : button;
  }
}
