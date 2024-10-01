import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_project/model/datewise_appointments_model.dart';
import 'package:hms_project/model/doctor_patient_model.dart';
import 'package:http/http.dart' as http;

class ScheduledAppointmentController with ChangeNotifier {
  List<DatewiseAppointmentsModel> appointmentslist = [];
  Future<void> appointmentsdata(
      {required String docid, required String? date}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/doctor_patients.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        "doctoridcontroller": docid,
        "datecontroller": date.toString()
      });
      log(res.body);

      List<dynamic> appointmentdatalist = jsonDecode(res.body);
      log('--------------${appointmentdatalist.toString()}');
      appointmentslist = appointmentdatalist
          .map(
            (json) => DatewiseAppointmentsModel.fromJson(json),
          )
          .toList();
      log(appointmentslist.toString());
      if (res.statusCode == 200) {
        print("Created Appointment");
      } else {
        print("Failed to create");
      }
      log(appointmentslist.toString());
    } catch (e) {
      appointmentslist.clear;
      log(e.toString());
    }
    notifyListeners();
  }
}
