// To parse this JSON data, do
//
//     final PasswordUpdateResModel = PasswordUpdateResModelFromJson(jsonString);

import 'dart:convert';

PasswordUpdateResModel PasswordUpdateResModelFromJson(String str) => PasswordUpdateResModel.fromJson(json.decode(str));

String PasswordUpdateResModelToJson(PasswordUpdateResModel data) => json.encode(data.toJson());

class PasswordUpdateResModel {
    String message;

    PasswordUpdateResModel({
        required this.message,
    });

    factory PasswordUpdateResModel.fromJson(Map<String, dynamic> json) => PasswordUpdateResModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
