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

  ListElement({
    this.fname,
    this.lname,
    this.pid,
    this.doc,
    this.presc,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        fname: json["fname"],
        lname: json["lname"],
        pid: json["pid"],
        doc: json["doc"],
        presc: json["presc"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "pid": pid,
        "doc": doc,
        "presc": presc,
      };
}
