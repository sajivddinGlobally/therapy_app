// To parse this JSON data, do
//
//     final passUpdateResSuccModel = passUpdateResSuccModelFromJson(jsonString);

import 'dart:convert';

PassUpdateResSuccModel passUpdateResSuccModelFromJson(String str) => PassUpdateResSuccModel.fromJson(json.decode(str));

String passUpdateResSuccModelToJson(PassUpdateResSuccModel data) => json.encode(data.toJson());

class PassUpdateResSuccModel {
    String message;

    PassUpdateResSuccModel({
        required this.message,
    });

    factory PassUpdateResSuccModel.fromJson(Map<String, dynamic> json) => PassUpdateResSuccModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
