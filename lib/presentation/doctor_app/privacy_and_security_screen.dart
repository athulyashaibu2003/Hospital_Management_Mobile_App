import 'package:flutter/material.dart';
import 'package:hms_project/presentation/doctor_app/doctor_login_page.dart';
import 'package:hms_project/presentation/doctor_app/forget_password_screen.dart';

class PrivacyAndSecurityScreen extends StatefulWidget {
  const PrivacyAndSecurityScreen({super.key});

  @override
  State<PrivacyAndSecurityScreen> createState() =>
      _PrivacyAndSecurityScreenState();
}

class _PrivacyAndSecurityScreenState extends State<PrivacyAndSecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()));
              },
              child: Row(
                children: [
                  Icon(Icons.psychology_alt_sharp),
                  Spacer(),
                  Text("Reset Password"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(Icons.delete),
                Spacer(),
                Text("Delete Account"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/reset-password.png",
                  height: 20,
                ),
                Spacer(),
                Text("Password Change"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
