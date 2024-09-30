// To parse this JSON data, do
//
//     final doctorPatientDetailsModel = doctorPatientDetailsModelFromJson(jsonString);

import 'dart:convert';

DatewiseAppointmentsModel doctorPatientDetailsModelFromJson(String str) =>
    DatewiseAppointmentsModel.fromJson(json.decode(str));

String doctorPatientDetailsModelToJson(DatewiseAppointmentsModel data) =>
    json.encode(data.toJson());

class DatewiseAppointmentsModel {
  String? patientid;
  String? fname;
  String? lname;
  String? dep;
  String? doc;
  String? date;
  String? starttime;
  String? endtime;

  DatewiseAppointmentsModel({
    this.patientid,
    this.fname,
    this.lname,
    this.dep,
    this.doc,
    this.date,
    this.starttime,
    this.endtime,
  });

  factory DatewiseAppointmentsModel.fromJson(Map<String, dynamic> json) =>
      DatewiseAppointmentsModel(
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
