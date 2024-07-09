import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/core/constant/app_size.dart';
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
  await Supabase.initialize(
   url: dotenv.get("SUPABASE_URL"),
    anonKey: dotenv.get("SUPABASE_ANON_KEY")
 );
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
      getPages: routers,
    );
  }
}