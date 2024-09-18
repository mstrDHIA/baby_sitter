

import 'package:babysitter_v1/src/core/constant/app_size.dart';
import 'package:babysitter_v1/src/view/screens/chat/chat_screen.dart';
import 'package:babysitter_v1/src/view/screens/onboarding/onboarding_screen.dart';
import 'package:babysitter_v1/src/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'src/core/cons tant/app_size.dart';
import 'src/core/constant/app_string.dart';
import 'src/core/constant/app_theme.dart';
import 'src/core/service/initial_service.dart';
import 'src/routeurs/routeurs.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:supabase_flutter/supabase_flutter.dart';







void main() async {
 



  WidgetsFlutterBinding.ensureInitialized();
  
  sharedPref = await SharedPreferences.getInstance();
  timeago.setLocaleMessages('fr', timeago.FrMessages());
  await initialServices();
  await dotenv.load(fileName: ".env");
  
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
  
  if (supabaseUrl == null || supabaseAnonKey == null) {
    print('Supabase URL or Anon Key is not set in the .env file');
    return;
  }

  try {
     await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  } catch (error) {
    print('Erreur lors de l\'initialisation de Supabase: $error');
    return;
  }

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;
SharedPreferences? sharedPref;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetMaterialApp(
      title: AppString.appName,
      theme: AppTheme().lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // getPages: routers,
    );
  }
}
