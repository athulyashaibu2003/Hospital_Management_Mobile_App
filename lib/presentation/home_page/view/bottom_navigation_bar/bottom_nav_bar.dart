import 'package:flutter/material.dart';
import 'package:hms_project/main.dart';
import 'package:hms_project/presentation/home_page/view/home_page.dart';
import 'package:hms_project/presentation/home_page/view/logout_screen/logout_screen.dart';
import 'package:hms_project/presentation/home_page/view/profile_screen/profile_screen.dart';
import 'package:hms_project/presentation/login_page/view/login_page.dart';
import 'package:easy_localization/easy_localization.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = const [
    HomePage(),
    ProfileScreen(),
    LogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 5, 92, 87),
            selectedItemColor: const Color(0xff0ea69f),
            unselectedItemColor: Colors.white,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {});
              myCurrentIndex = index;
              if (myCurrentIndex == 2) {
                // Settings is at index 2
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Implement your logout functionality here
                            // For example, you might want to navigate to a login screen:
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "home".tr()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wallet_rounded), label: "profile".tr()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.exit_to_app_rounded), label: "logout".tr()),
            ],
          ),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
