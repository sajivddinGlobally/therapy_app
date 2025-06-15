// To parse this JSON data, do
//
//     final updatePasswordResModel = updatePasswordResModelFromJson(jsonString);

import 'dart:convert';

UpdatePasswordResModel updatePasswordResModelFromJson(String str) => UpdatePasswordResModel.fromJson(json.decode(str));

String updatePasswordResModelToJson(UpdatePasswordResModel data) => json.encode(data.toJson());

class UpdatePasswordResModel {
    String message;
    int expiresIn;

    UpdatePasswordResModel({
        required this.message,
        required this.expiresIn,
    });

    factory UpdatePasswordResModel.fromJson(Map<String, dynamic> json) => UpdatePasswordResModel(
        message: json["message"],
        expiresIn: json["expires_in"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "expires_in": expiresIn,
    };
}
