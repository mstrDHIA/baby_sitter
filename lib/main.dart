import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/core/constant/app_size.dart';
import 'src/core/constant/app_string.dart';
import 'src/core/constant/app_theme.dart';
import 'src/core/service/initial_service.dart';
import 'src/routeurs/routeurs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetMaterialApp(
      title: AppString.appName,
      theme: AppTheme().lightTheme,
      debugShowCheckedModeBanner: false,
      getPages: routers,
    );
  }
}
