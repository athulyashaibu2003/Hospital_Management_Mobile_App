import 'package:flutter/material.dart';
import 'package:hms_project/controller/search_screen_controller.dart';
import 'package:hms_project/controller/sos_controller.dart';
import 'package:hms_project/presentation/home_page/view/home_page.dart';
import 'package:hms_project/presentation/home_page/view/logout_screen/logout_screen.dart';
import 'package:hms_project/presentation/home_page/view/new_user.dart/new_user.dart';
import 'package:hms_project/presentation/home_page/view/profile_screen/profile_screen.dart';
import 'package:hms_project/presentation/login_page/view/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

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
    const LogoutScreen(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var patientDetailsProvider = Provider.of<SearchScreenController>(context);
    var sosFunctionProvider =
        Provider.of<SosController>(context, listen: false);
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
            backgroundColor: const Color(0xff06a1a0),
            selectedItemColor: const Color.fromARGB(255, 5, 92, 87),
            unselectedItemColor: Colors.white,
            currentIndex: myCurrentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {});
              myCurrentIndex = index;
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 385),
        child: myCurrentIndex == 0
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Ambulance floating button
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    child: Image(image: AssetImage("assets/images/49990.jpg")),
                    // backgroundImage: AssetImage("assets/images/49990.jpg"),

                    // child: Image.asset(
                    //   "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg",
                    //   fit: BoxFit.fill,
                    // ),
                    onPressed: () async {
                      await sosFunctionProvider.Ambulance(
                          patientDetailsProvider);
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          Future.delayed(
                            Duration(milliseconds: 2000),
                            () {
                              Navigator.pop(context);
                            },
                          );
                          return AlertDialog(
                            title: Text("Help is on the way"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                      'https://sa1s3optim.patientpop.com/assets/images/provider/photos/2520626.jpg'),
                                )
                              ],
                            ),
                            // content: Column(
                            //   mainAxisSize: MainAxisSize.min,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(patientDetailsProvider
                            //             .searchModel.list?[0].relcontact ??
                            //         ''),
                            //     Text(patientDetailsProvider
                            //             .searchModel.list?[0].reltype ??
                            //         ''),
                            //   ],
                            // ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  // SOS floating bu10tton
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(
                          "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg"),
                    ),
                    // child: Image.asset(
                    //   "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg",
                    //   fit: BoxFit.fill,
                    // ),
                    onPressed: () async {
                      await sosFunctionProvider.callSos(patientDetailsProvider);

                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          Future.delayed(
                            Duration(milliseconds: 2000),
                            () {
                              Navigator.pop(context);
                            },
                          );
                          return AlertDialog(
                            title: Text("Your SOS Alert have been sent"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(patientDetailsProvider
                                        .searchModel.list?[0].relcontact ??
                                    ''),
                                Text(patientDetailsProvider
                                        .searchModel.list?[0].reltype ??
                                    ''),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            : null,
      ),
      body: pages[myCurrentIndex],
    );
  }
}
