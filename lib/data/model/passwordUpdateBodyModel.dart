// To parse this JSON data, do
//
//     final PasswordUpdateBodyModel = PasswordUpdateBodyModelFromJson(jsonString);

import 'dart:convert';

PasswordUpdateBodyModel PasswordUpdateBodyModelFromJson(String str) =>
    PasswordUpdateBodyModel.fromJson(json.decode(str));

String PasswordUpdateBodyModelToJson(PasswordUpdateBodyModel data) =>
    json.encode(data.toJson());

class PasswordUpdateBodyModel {
  String email;
  String otp;
  String password;
  String passwordConfirmation;

  PasswordUpdateBodyModel({
    required this.email,
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
  });

  factory PasswordUpdateBodyModel.fromJson(Map<String, dynamic> json) =>
      PasswordUpdateBodyModel(
        email: json["email"],
        otp: json["otp"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
    "email": email,
    "otp": otp,
    "password": password,
    "password_confirmation": passwordConfirmation,
  };
}
