import 'package:flutter/material.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/presentation/home_page/view/home_page.dart';
import 'package:hms_project/presentation/home_page/view/new_user.dart/new_user.dart';
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
  List pages = [
    const HomePage(),
    const PatientProfileScreen(),
    const NewUser(),
    null
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var patientDetailsProvider = Provider.of<SearchScreenController>(context);
    // var sosFunctionProvider =
    //     Provider.of<SosController>(context, listen: false);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(    
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: ColorConstants.mainBlue,
            selectedItemColor: ColorConstants.mainOrange,
            unselectedItemColor: Colors.white,
            currentIndex: myCurrentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {});
            myCurrentIndex = index;
            print(index);
            print(myCurrentIndex);
              if (myCurrentIndex == 3) {
                // Settings is at index 2
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            setState(() {});
                            myCurrentIndex = 0;
                          Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
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
                  icon: const Icon(Icons.home_outlined), label: "home".tr()),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.wallet_rounded),
                  label: "profile".tr()),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                  ),
                  label: "New user".tr()),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.exit_to_app_rounded),
                  label: "logout".tr()),
            ],
          ),
        ),
      ),
      // floatingActionButton: myCurrentIndex == 0
      //     ? Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           // Ambulance floating button
      //           FloatingActionButton(
      //             shape: const CircleBorder(),
      //             child: Image(image: AssetImage("assets/images/49990.jpg")),
      //             // backgroundImage: AssetImage("assets/images/49990.jpg"),

      //             // child: Image.asset(
      //             //   "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg",
      //             //   fit: BoxFit.fill,
      //             // ),
      //             onPressed:
      //           ),
      //           SizedBox(height: 10),
      //           // SOS floating button
      //           FloatingActionButton(
      //             shape: const CircleBorder(),
      //             child: const CircleAvatar(
      //               radius: 45,
      //               backgroundImage: AssetImage(
      //                   "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg"),
      //             ),
      //             // child: Image.asset(
      //             //   "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg",
      //             //   fit: BoxFit.fill,
      //             // ),
      //             onPressed: () async {

      //             },
      //           ),
      //         ],
      //      )
      //  : null,
      body: pages[myCurrentIndex],
    );
  }
}
