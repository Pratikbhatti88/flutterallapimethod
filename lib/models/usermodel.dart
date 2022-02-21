// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    required this.id,
    required this.userName,
    required this.password,
  });

  int id;
  String userName;
  String password;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
    id: json["id"],
    userName: json["userName"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "password": password,
  };
}
