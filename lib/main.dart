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
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

enum MyRealtimeLogLevel { info, debug, warn, error }

class MyRealtimeClientOptions {
  @Deprecated('Client side rate limit has been removed. This option will be ignored.')
  final int? eventsPerSecond;
  final MyRealtimeLogLevel? logLevel;
  final Duration? timeout;

  const MyRealtimeClientOptions({
    this.eventsPerSecond,
    this.logLevel,
    this.timeout,
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  sharedPref = await SharedPreferences.getInstance();
  timeago.setLocaleMessages('fr', timeago.FrMessages());
  await initialServices();
  await Supabase.initialize(
    url: dotenv.get("SUPABASE_URL"),
    anonKey: dotenv.get("SUPABASE_ANON_KEY"),
    realtimeClientOptions: const MyRealtimeClientOptions(
      eventsPerSecond: 2,
    ) as RealtimeClientOptions, // Cast to RealtimeClientOptions
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
