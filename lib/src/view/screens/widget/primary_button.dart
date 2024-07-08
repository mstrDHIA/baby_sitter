import 'package:flutter/material.dart';
import 'package:babysitter_v1/src/core/constant/app_color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.name,
    required this.onPressed,
    this.isSecondary,
    this.disabled,
    this.loading,
  }) : super(key: key);

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
          child: loading == null || loading == false
              ? Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: PrimaryColors().whiteA700,
                  ),
                )
              : Container(
                  width: 21,
                  height: 21,
                  child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                ),
          style: ElevatedButton.styleFrom(
            backgroundColor: isSecondary == null || isSecondary == false
                ? PrimaryColors().red800
                : ColorSchemes.primaryColorScheme.primary,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            minimumSize: Size(MediaQuery.sizeOf(context).width, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
