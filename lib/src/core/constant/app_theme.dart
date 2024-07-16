import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme extends GetxController {
  ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle( fontSize: 40,fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    
    ),
  );
}
