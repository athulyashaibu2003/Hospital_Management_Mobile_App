import 'package:flutter/material.dart';
import 'package:hms_project/controller/search_screen_controller.dart';
import 'package:http/http.dart' as http;

class SosController with ChangeNotifier {
  callSos(SearchScreenController patientProvider) async {
    var res = await http.post(
        Uri.parse('https://cybot.avanzosolutions.in/hms/emergency.php'),
        body: {
          'firstnamecontroller':
              patientProvider.searchModel.list?[0].fname ?? '',
          'lastnamecontroller':
              patientProvider.searchModel.list?[0].lname ?? '',
          'doctornamecontroller':
              patientProvider.searchModel.list?[0].doc ?? '',
          'patientidcontroller': patientProvider.searchModel.list?[0].pid ?? '',
          'phonecontroller': patientProvider.searchModel.list?[0].mob ?? '',
          'rel_phonecontroller':
              patientProvider.searchModel.list?[0].relcontact ?? '',
          'datenumbercontroller': DateTime.now().toString(),
          'addresscontroller':
              patientProvider.searchModel.list?[0].address ?? '',
          'issue_regcontroller':
              patientProvider.searchModel.list?[0].presc ?? '',
          'departmentcontroller':
              patientProvider.searchModel.list?[0].department ?? '',
        });
    print(res.body);
    notifyListeners();
  }

  Ambulance(SearchScreenController patientProvider) async {
    var res = await http.post(
        Uri.parse('https://cybot.avanzosolutions.in/hms/ambulance_alerts.php'),
        body: {
          'firstnamecontroller':
              patientProvider.searchModel.list?[0].fname ?? '',
          'lastnamecontroller':
              patientProvider.searchModel.list?[0].lname ?? '',
          'doctornamecontroller':
              patientProvider.searchModel.list?[0].doc ?? '',
          "patientidcontroller": patientProvider.searchModel.list?[0].pid ?? '',
          "departmentcontroller":
              patientProvider.searchModel.list?[0].department ?? '',
          "issue_regcontroller":
              patientProvider.searchModel.list?[0].presc ?? '',
          "phonecontroller": patientProvider.searchModel.list?[0].mob ?? '',
          "rel_phonecontroller":
              patientProvider.searchModel.list?[0].relcontact ?? '',
          'addresscontroller':
              patientProvider.searchModel.list?[0].address ?? '',
          'datenumbercontroller': DateTime.now().toString(),
        });
    print(res.body);
    notifyListeners();
  }
}
