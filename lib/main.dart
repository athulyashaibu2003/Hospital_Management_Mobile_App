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
    supportedLocales: [
      Locale('en'),
      Locale('kn'),
      Locale('ml'),
    ],
    path: 'assets/language/',
    child: MyApp(),
  ));
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
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
