// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.email,
    this.gender,
    this.training,
    this.password,
    this.cnfPassword,
  });

  String email;
  String gender;
  String training;
  String password;
  String cnfPassword;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        email: json["email"] == null ? null : json["email"],
        gender: json["gender"] == null ? null : json["gender"],
        training: json["training"] == null ? null : json["training"],
        password: json["password"] == null ? null : json["password"],
        cnfPassword: json["cnf_password"] == null ? null : json["cnf_password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "gender": gender == null ? null : gender,
        "training": training == null ? null : training,
        "password": password == null ? null : password,
        "cnf_password": cnfPassword == null ? null : cnfPassword,
      };
}
