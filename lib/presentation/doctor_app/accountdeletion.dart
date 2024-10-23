import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_project/controller/doctor_name_controller.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/presentation/doctor_app/doctor_login_page.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DeleteAccountScreen extends StatefulWidget {
  @override
  _DeleteAccountScreenState createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  Future<void> deleteAccount(String docid) async {
    final url =
        Uri.parse("https://cybot.avanzosolutions.in/hms/doctor_delete.php");

    try {
      final response = await http.post(
        url,
        body: {
          'doctoridcontroller': docid,
        },
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result['status'] == 'success') {
          print('Account deleted successfully');

          // Navigate to login page after account deletion
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DoctorLoginpage()),
          );
        } else {
          print(result['message']);
        }
      } else {
        print('Failed to connect to the server');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var doctorProvider = Provider.of<DoctorNameController>(context);
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel',
                  style: TextStyle(color: ColorConstants.mainBlue)),
            ),
            TextButton(
              onPressed: () {
                // Call the delete account function
                deleteAccount(doctorProvider.userCredentialsModel!.id!);
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(
                'Delete',
                style: TextStyle(color: ColorConstants.mainBlue),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Account'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(ColorConstants.lightgreen)),
          onPressed: _confirmDeleteAccount,
          child: Text(
            'Delete Account',
            style: TextStyle(color: ColorConstants.mainwhite),
          ),
        ),
      ),
    );
  }
}
