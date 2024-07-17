// To parse this JSON data, do
//
//     final apicallingsample = apicallingsampleFromJson(jsonString);

import 'dart:convert';

List<String> apicallingsampleFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String apicallingsampleToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
