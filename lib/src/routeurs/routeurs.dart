import 'package:get/get.dart';
import '../core/constant/app_route.dart';
import '../view/screens/splash/splash_screen.dart';

List<GetPage<dynamic>>? routers = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
];
