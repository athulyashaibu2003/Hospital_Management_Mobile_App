// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  List<ListElement>? list;

  SearchModel({
    this.list,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  String? fname;
  String? lname;
  String? pid;
  String? doc;
  String? presc;
  String? mob;
  String? dob;
  String? address;
  String? department;
  String? email;
  String? img;
  String? reltype;
  String? relcontact;
  String? gender;
  String? bldgrp;

  ListElement({
    this.fname,
    this.lname,
    this.pid,
    this.doc,
    this.presc,
    this.mob,
    this.dob,
    this.address,
    this.department,
    this.email,
    this.img,
    this.reltype,
    this.relcontact,
    this.gender,
    this.bldgrp,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        fname: json["fname"],
        lname: json["lname"],
        pid: json["pid"],
        doc: json["doc"],
        presc: json["presc"],
        mob: json["mob"],
        dob: json["dob"],
        address: json["Address"],
        department: json["Department"],
        email: json["email"],
        img: json["img"],
        reltype: json["reltype"],
        relcontact: json["relcontact"],
        gender: json["gender"],
        bldgrp: json["bldgrp"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "pid": pid,
        "doc": doc,
        "presc": presc,
        "mob": mob,
        "dob": dob,
        "Address": address,
        "Department": department,
        "email": email,
        "img": img,
        "reltype": reltype,
        "relcontact": relcontact,
        "gender": gender,
        "bldgrp": bldgrp,
      };
}
