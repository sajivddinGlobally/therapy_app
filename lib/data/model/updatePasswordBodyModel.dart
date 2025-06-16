// To parse this JSON data, do
//
//     final updatePasswordBodyModel = updatePasswordBodyModelFromJson(jsonString);

import 'dart:convert';

UpdatePasswordBodyModel updatePasswordBodyModelFromJson(String str) =>
    UpdatePasswordBodyModel.fromJson(json.decode(str));

String updatePasswordBodyModelToJson(UpdatePasswordBodyModel data) =>
    json.encode(data.toJson());

class UpdatePasswordBodyModel {
  String email;

  UpdatePasswordBodyModel({required this.email});

  factory UpdatePasswordBodyModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordBodyModel(email: json["email"]);

  Map<String, dynamic> toJson() => {"email": email};
}
