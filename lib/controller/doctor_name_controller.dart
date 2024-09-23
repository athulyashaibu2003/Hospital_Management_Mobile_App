import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_project/model/user_credential_model.dart';
import 'package:http/http.dart' as http;

class DoctorNameController with ChangeNotifier {
  UserCredentialsModel userCredentialsModel = UserCredentialsModel();
  Future<void> patientdata(
      {required String username, required String password}) async {
    notifyListeners();
    String uri = "https://cybot.avanzosolutions.in/hms/useridpass.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        "loginusernamecontroller": username,
        "loginpasswordcontroller": password
      });
      log(res.body);
      var json = jsonDecode(res.body);
      userCredentialsModel = UserCredentialsModel.fromJson(json);
      log(userCredentialsModel.id ?? '');
      // var json = await jsonDecode(res.body) as Map<String, dynamic>;
      // print(json);
      // searchModel = SearchModel.fromJson(json);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
