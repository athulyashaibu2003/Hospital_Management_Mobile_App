// To parse this JSON data, do
//
//     final userCredentialsModel = userCredentialsModelFromJson(jsonString);

import 'dart:convert';

UserCredentialsModel userCredentialsModelFromJson(String str) =>
    UserCredentialsModel.fromJson(json.decode(str));

String userCredentialsModelToJson(UserCredentialsModel data) =>
    json.encode(data.toJson());

class UserCredentialsModel {
  String? id;
  String? name;

  UserCredentialsModel({
    this.id,
    this.name,
  });

  factory UserCredentialsModel.fromJson(Map<String, dynamic> json) =>
      UserCredentialsModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
