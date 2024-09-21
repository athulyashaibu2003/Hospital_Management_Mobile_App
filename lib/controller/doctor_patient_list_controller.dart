import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_project/model/doctor_patient_model.dart';
import 'package:http/http.dart' as http;

class DoctorPatientListController with ChangeNotifier {
  List<DoctorPatientDetailsModel> patientDetailsList = [];
  Future<void> docotorPatientdata() async {
    String uri =
        "https://cybot.avanzosolutions.in/hms/doctorpatientdetails.php";
    try {
      var res = await http.get(
        Uri.parse(uri),
      );
      // log(res.body);
      // log(jsonDecode(res.body).toString());
      List<dynamic> dataList = jsonDecode(res.body);
      patientDetailsList = dataList
          .map(
            (json) => DoctorPatientDetailsModel.fromJson(json),
          )
          .toList();
      log(patientDetailsList.toString());
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
