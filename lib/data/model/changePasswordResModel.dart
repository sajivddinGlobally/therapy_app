// To parse this JSON data, do
//
//     final changePasswordResModel = changePasswordResModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordResModel changePasswordResModelFromJson(String str) => ChangePasswordResModel.fromJson(json.decode(str));

String changePasswordResModelToJson(ChangePasswordResModel data) => json.encode(data.toJson());

class ChangePasswordResModel {
    bool success;
    String message;

    ChangePasswordResModel({
        required this.success,
        required this.message,
    });

    factory ChangePasswordResModel.fromJson(Map<String, dynamic> json) => ChangePasswordResModel(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
