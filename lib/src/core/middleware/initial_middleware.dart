import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}
