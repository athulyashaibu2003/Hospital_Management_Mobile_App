import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hms_project/controller/booking_patient_controller.dart';
import 'package:hms_project/controller/search_screen_controller.dart';
import 'package:hms_project/presentation/splash_screen/view/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ml', 'IN'),
        Locale('kn', 'IN'),
      ],
      path: 'assets/translations',
      // fallbackLocale: const Locale('en', 'US'),
      // startLocale: const Locale('en', 'US'),
      // saveLocale: false,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingPatientController(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
