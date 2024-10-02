// To parse this JSON data, do
//
//     final fullAppointmentModel = fullAppointmentModelFromJson(jsonString);

import 'dart:convert';

FullAppointmentModel fullAppointmentModelFromJson(String str) =>
    FullAppointmentModel.fromJson(json.decode(str));

String fullAppointmentModelToJson(FullAppointmentModel data) =>
    json.encode(data.toJson());

class FullAppointmentModel {
  String? patientid;
  String? fname;
  String? lname;
  String? dep;
  String? doc;
  String? date;
  String? starttime;
  String? endtime;

  FullAppointmentModel({
    this.patientid,
    this.fname,
    this.lname,
    this.dep,
    this.doc,
    this.date,
    this.starttime,
    this.endtime,
  });

  factory FullAppointmentModel.fromJson(Map<String, dynamic> json) =>
      FullAppointmentModel(
        patientid: json["patientid"],
        fname: json["fname"],
        lname: json["lname"],
        dep: json["dep"],
        doc: json["doc"],
        date: json["date"],
        starttime: json["starttime"],
        endtime: json["endtime"],
      );

  Map<String, dynamic> toJson() => {
        "patientid": patientid,
        "fname": fname,
        "lname": lname,
        "dep": dep,
        "doc": doc,
        "date": date,
        "starttime": starttime,
        "endtime": endtime,
      };
}
