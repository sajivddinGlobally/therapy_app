// To parse this JSON data, do
//
//     final changePasswordBodyModel = changePasswordBodyModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordBodyModel changePasswordBodyModelFromJson(String str) => ChangePasswordBodyModel.fromJson(json.decode(str));

String changePasswordBodyModelToJson(ChangePasswordBodyModel data) => json.encode(data.toJson());

class ChangePasswordBodyModel {
    String newPassword;
    String newPasswordConfirmation;

    ChangePasswordBodyModel({
        required this.newPassword,
        required this.newPasswordConfirmation,
    });

    factory ChangePasswordBodyModel.fromJson(Map<String, dynamic> json) => ChangePasswordBodyModel(
        newPassword: json["new_password"],
        newPasswordConfirmation: json["new_password_confirmation"],
    );

    Map<String, dynamic> toJson() => {
        "new_password": newPassword,
        "new_password_confirmation": newPasswordConfirmation,
    };
}
