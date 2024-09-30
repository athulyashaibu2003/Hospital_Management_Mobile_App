/// To parse this JSON data, do
//
//     final doctorPatientDetailsModel = doctorPatientDetailsModelFromJson(jsonString);

import 'dart:convert';

DoctorPatientDetailsModel doctorPatientDetailsModelFromJson(String str) =>
    DoctorPatientDetailsModel.fromJson(json.decode(str));

String doctorPatientDetailsModelToJson(DoctorPatientDetailsModel data) =>
    json.encode(data.toJson());

class DoctorPatientDetailsModel {
  String? id;
  String? name;
  String? doc;
  String? presc;
  String? mob;
  String? gender;
  String? guardian;
  dynamic reltype;
  String? relnumber;
  String? date;

  DoctorPatientDetailsModel({
    this.id,
    this.name,
    this.doc,
    this.presc,
    this.mob,
    this.gender,
    this.guardian,
    this.reltype,
    this.relnumber,
    this.date,
  });

  factory DoctorPatientDetailsModel.fromJson(Map<String, dynamic> json) =>
      DoctorPatientDetailsModel(
        id: json["id"],
        name: json["name"],
        doc: json["doc"],
        presc: json["presc"],
        mob: json["mob"],
        gender: json["gender"],
        guardian: json["guardian"],
        reltype: json["reltype"],
        relnumber: json["relnumber"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "doc": doc,
        "presc": presc,
        "mob": mob,
        "gender": gender,
        "guardian": guardian,
        "reltype": reltype,
        "relnumber": relnumber,
        "date": date,
      };
}
