import 'package:flutter/material.dart';
import 'package:hms_project/presentation/home_page/view/bottom_navigation_bar/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/Family-Icon-for-Developers.gif"),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff26ace9)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyBottomNavBar(),
                    ));
              },
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
