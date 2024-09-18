import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:flutter/material.dart';


class TextPlanification extends StatelessWidget {
  const TextPlanification(this.label, {Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: "Quicksand",
            color: AppColor.blueGray900,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
