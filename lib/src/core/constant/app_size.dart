import 'package:flutter/material.dart';

class AppSize {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static const kPadding = 20.0;

  static Orientation? orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;
  }
}
