import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_project/model/search_model.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier {
  SearchModel searchModel = SearchModel();
  Future<void> patientdata(String searchText) async {
    notifyListeners();
    String uri = "https://cybot.avanzosolutions.in/hms/patientname.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        "patientnamecontroller": searchText,
      });
      var json = await jsonDecode(res.body) as Map<String, dynamic>;
      print(json);
      searchModel = SearchModel.fromJson(json);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
