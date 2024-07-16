import 'package:babysitter_v1/src/core/constant/app_color.dart';
import 'package:flutter/material.dart';


class RegisterSteps extends StatelessWidget {
  const RegisterSteps(
      {Key? key, required this.nbSteps, required this.currentStep})
      : super(key: key);

  final int nbSteps, currentStep;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 5,
          decoration: BoxDecoration(
            color: AppColor.blueGray100,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Container(
            width: MediaQuery.sizeOf(context).width * (currentStep / nbSteps),
            height: 5,
            decoration: BoxDecoration(
              color: AppColor.pink800,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
        Positioned(
          right: 0,
          top: 7,
          child: Text(
            "$currentStep/$nbSteps",
            style: TextStyle(
              fontSize: 13,
              color: AppColor.blueGray255,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
