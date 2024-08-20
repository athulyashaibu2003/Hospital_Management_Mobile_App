import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hms_project/presentation/home_page/view/bottom_navigation_bar/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2160), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyBottomNavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/layers animation icon2_5.gif"),
          ),
          // ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         backgroundColor: const Color(0xff26ace9)),
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const MyBottomNavBar(),
          //           ));
          //     },
          //     child: const Text(
          //       "Get Started",
          //       style: TextStyle(fontSize: 20, color: Colors.white),
          //     ))
        ],
      ),
    );
  }
}
