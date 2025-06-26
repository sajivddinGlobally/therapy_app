// To parse this JSON data, do
//
//     final SendOTPResModel = SendOTPResModelFromJson(jsonString);

import 'dart:convert';

SendOTPResModel SendOTPResModelFromJson(String str) => SendOTPResModel.fromJson(json.decode(str));

String SendOTPResModelToJson(SendOTPResModel data) => json.encode(data.toJson());

class SendOTPResModel {
    String message;
    int expiresIn;

    SendOTPResModel({
        required this.message,
        required this.expiresIn,
    });

    factory SendOTPResModel.fromJson(Map<String, dynamic> json) => SendOTPResModel(
        message: json["message"],
        expiresIn: json["expires_in"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "expires_in": expiresIn,
    };
}
