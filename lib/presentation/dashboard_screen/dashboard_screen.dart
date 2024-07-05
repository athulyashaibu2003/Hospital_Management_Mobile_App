// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:hms_project/presentation/analysis_page/analysis_page.dart';
// import 'package:hms_project/presentation/appointment_page/appointment_page.dart';
// import 'package:hms_project/presentation/emr_page/emr_page.dart';
// import 'package:hms_project/presentation/ip_billing_page/ip_billing_page.dart';
// import 'package:hms_project/presentation/lab_page/lab_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: const Color.fromARGB(255, 52, 138, 96),
      ),
      backgroundColor: Color(0xff0ea69f),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff26ace9),
                ),
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.medical_services,
                  color: Color(0xff26ace9),
                  size: 30,
                ),
                title: Text(
                  'EMR',
                  style: TextStyle(color: Color(0xff26ace9), fontSize: 20),
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => EmrPage(),
                  //     ));
                  // print('EMR pressed');
                },
              ),
              Divider(
                color: Colors.blueAccent,
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: Color(0xff26ace9),
                  size: 30,
                ),
                title: Text(
                  'Appointments',
                  style: TextStyle(color: Color(0xff26ace9), fontSize: 20),
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => AppointmentPage(),
                  //     ));
                },
              ),
              Divider(
                color: Colors.blueAccent,
              ),
              ListTile(
                leading: Icon(
                  Icons.science,
                  color: Color(0xff26ace9),
                  size: 30,
                ),
                title: Text(
                  'Lab',
                  style: TextStyle(color: Color(0xff26ace9), fontSize: 20),
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => LabPage(),
                  //     ));
                },
              ),
              Divider(
                color: Colors.blueAccent,
              ),
              ListTile(
                leading: Icon(
                  Icons.receipt_long,
                  color: Color(0xff26ace9),
                  size: 30,
                ),
                title: Text(
                  'IP Billing',
                  style: TextStyle(color: Color(0xff26ace9), fontSize: 20),
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => IpBillingPage(),
                  //     ));
                },
              ),
              Divider(
                color: Colors.blueAccent,
              ),
              ListTile(
                leading: Icon(
                  Icons.analytics,
                  color: Color(0xff26ace9),
                  size: 30,
                ),
                title: Text(
                  'Analysis',
                  style: TextStyle(color: Color(0xff26ace9), fontSize: 20),
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => AnalysisPage(),
                  //     ));
                },
              ),
              Divider(
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Dashboard Content Here',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
