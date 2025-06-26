// To parse this JSON data, do
//
//     final sendOtoBodyModel = sendOtoBodyModelFromJson(jsonString);
import 'dart:convert';

SendOtoBodyModel sendOtoBodyModelFromJson(String str) =>
    SendOtoBodyModel.fromJson(json.decode(str));

String sendOtoBodyModelToJson(SendOtoBodyModel data) =>
    json.encode(data.toJson());

class SendOtoBodyModel {
  String email;

  SendOtoBodyModel({required this.email});

  factory SendOtoBodyModel.fromJson(Map<String, dynamic> json) =>
      SendOtoBodyModel(email: json["email"]);

  Map<String, dynamic> toJson() => {"email": email};
}


