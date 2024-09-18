import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:flutter/material.dart';


class OutlinePrimaryButton extends StatelessWidget {
  const OutlinePrimaryButton(
      {Key? key,
      required this.name,
      required this.onPressed,
      this.isSecondary,
      this.disabled,
      this.loading})
      : super(key: key);

  final String name;
  final VoidCallback onPressed;
  final bool? isSecondary, disabled, loading;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled == null || disabled == false ? 1 : 0.5,
      child: IgnorePointer(
        ignoring: disabled == null || disabled == false ? false : true,
        child: OutlinedButton(
          onPressed: onPressed,
          child: loading == null || loading == false
              ? Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: AppColor.primaryColor,
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
