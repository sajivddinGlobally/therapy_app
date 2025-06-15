// To parse this JSON data, do
//
//     final passUpdateBodySuccModel = passUpdateBodySuccModelFromJson(jsonString);

import 'dart:convert';

PassUpdateBodySuccModel passUpdateBodySuccModelFromJson(String str) => PassUpdateBodySuccModel.fromJson(json.decode(str));

String passUpdateBodySuccModelToJson(PassUpdateBodySuccModel data) => json.encode(data.toJson());

class PassUpdateBodySuccModel {
    String email;
    String otp;
    String password;
    String passwordConfirmation;

    PassUpdateBodySuccModel({
        required this.email,
        required this.otp,
        required this.password,
        required this.passwordConfirmation,
    });

    factory PassUpdateBodySuccModel.fromJson(Map<String, dynamic> json) => PassUpdateBodySuccModel(
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
