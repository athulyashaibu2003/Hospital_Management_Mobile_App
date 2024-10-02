import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_project/model/full_appointment_model.dart';
import 'package:http/http.dart' as http;

class FullAppointmentController with ChangeNotifier {
  List<FullAppointmentModel> fullappointmentslist = [];
  Future<void> fullappointmentdata({required String docid}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/doctor_appointments.php";
    try {
      var res =
          await http.post(Uri.parse(uri), body: {"doctoridcontroller": docid});
      log('full appointment : ${res.body}');

      List<dynamic> appointmentslist = jsonDecode(res.body);
      log('--------------${fullappointmentslist.toString()}');
      fullappointmentslist = appointmentslist
          .map(
            (json) => FullAppointmentModel.fromJson(json),
          )
          .toList();
      log(fullappointmentslist.toString());
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
