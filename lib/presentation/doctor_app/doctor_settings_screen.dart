import 'package:flutter/material.dart';
import 'package:hms_project/controller/doctor_name_controller.dart';
import 'package:hms_project/controller/doctor_patient_list_controller.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/presentation/doctor_app/doctor_login_page.dart';
import 'package:hms_project/presentation/doctor_app/edit_profile_screen.dart';
import 'package:hms_project/presentation/doctor_app/privacy_and_security_screen.dart';
import 'package:hms_project/presentation/doctor_app/terms_and_conditions.dart';
import 'package:hms_project/presentation/login_page/view/login_page.dart';
import 'package:provider/provider.dart';

class DoctorSettingsScreen extends StatefulWidget {
  const DoctorSettingsScreen({super.key});

  @override
  State<DoctorSettingsScreen> createState() => _DoctorSettingsScreenState();
}

class _DoctorSettingsScreenState extends State<DoctorSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var doctorProvider = Provider.of<DoctorNameController>(context);
    // var patientDetailsProvider =
    //     Provider.of<DoctorPatientListController>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * .12,
            width: double.infinity,
            color: ColorConstants.mainwhite,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        "https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        doctorProvider.userCredentialsModel!.name ?? '',
                      ),
                      Text("doctor@highland.com")
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsAndConditionsScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(Icons.join_right_sharp),
                    SizedBox(
                      width: 25,
                    ),
                    Text("Terms and Conditions"),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyAndSecurityScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(Icons.admin_panel_settings_rounded),
                    SizedBox(
                      width: 25,
                    ),
                    Text("Privacy & Security"),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            )
          ]),
          SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                _showLogoutDialog(context); // Call the logout dialog method
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 25,
                    ),
                    Text("Logout"),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Logout',
          style: TextStyle(color: ColorConstants.mainBlue),
        ),
        content: Text('Do you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog on cancel
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: ColorConstants.mainBlue),
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigate to the login page and remove all previous routes

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(color: ColorConstants.mainBlue),
            ),
          ),
        ],
      );
    },
  );
}
