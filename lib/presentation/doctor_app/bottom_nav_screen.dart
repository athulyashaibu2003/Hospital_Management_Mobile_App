import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/presentation/doctor_app/doctor_appointment.dart';
import 'package:hms_project/presentation/doctor_app/doctor_homescreen.dart';
import 'package:hms_project/presentation/doctor_app/doctor_patient_screen.dart';
import 'package:hms_project/presentation/doctor_app/doctor_settings_screen.dart';

class DoctorBottomNavScreen extends StatefulWidget { 
  const DoctorBottomNavScreen({super.key});

  @override
  State<DoctorBottomNavScreen> createState() => _DoctorBottomNavScreenState();
}

class _DoctorBottomNavScreenState extends State<DoctorBottomNavScreen> {
  int myindex = 0;
  List pages = [
    const DoctorHomescreen(),
    const DoctorAppointmentScreen(),
    const DoctorPatientScreen(),
    const DoctorSettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(fontSize: 12),
          selectedLabelStyle: TextStyle(fontSize: 12),
          backgroundColor: ColorConstants.mainwhite,
          selectedItemColor: const Color.fromARGB(255, 5, 92, 87),
          unselectedItemColor: ColorConstants.mainBlack,
          //currentIndex: myCurrentIndex,
          currentIndex: myindex,
          onTap: (value) {
            myindex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: Container(
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0x3006a1a0),
                      borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Icon(Icons.home_max),
                ),
                icon: Container(
                  // padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Icon(Icons.home_max),
                ),
                label: "Dashboard"),
            BottomNavigationBarItem(
                activeIcon: Container(
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0x3006a1a0),
                      borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Icon(Icons.calendar_today_rounded),
                ),
                icon: Container(
                  // padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Icon(Icons.calendar_today_rounded),
                ),
                label: "Appointments"),
            BottomNavigationBarItem(
                activeIcon: Container(
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0x3006a1a0),
                      borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Icon(Icons.people_outline),
                ),
                icon: Container(
                  // padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Icon(Icons.people_outline),
                ),
                label: "Patients"),
            BottomNavigationBarItem(
                activeIcon: Container(
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0x3006a1a0),
                      borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Icon(Icons.settings_outlined),
                ),
                icon: Container(
                  // padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Icon(Icons.settings_outlined),
                ),
                label: "Settings"),
          ]),
      body: pages[myindex],
    );
  }
}
