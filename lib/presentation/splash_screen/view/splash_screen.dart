import 'package:flutter/material.dart';
import 'package:hms_project/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:hms_project/presentation/login_page/view/login_page.dart';

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
            child: Image.asset("assets/images/9432602.jpg"),
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xff26ace9)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
