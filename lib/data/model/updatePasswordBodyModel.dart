// To parse this JSON data, do
//
//     final updatePasswordBodyModel = updatePasswordBodyModelFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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

////////////////////////////////
class MyPasswordUpdateModel {
  final String email;
  final String otp;

  MyPasswordUpdateModel({required this.email, required this.otp});

  MyPasswordUpdateModel copyWith({String? email, String? otp}) {
    return MyPasswordUpdateModel(
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }
}

class MyPasswordNotifier extends StateNotifier<MyPasswordUpdateModel> {
  MyPasswordNotifier() : super(MyPasswordUpdateModel(email: "", otp: ""));

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateOtp(String otp) {
    state = state.copyWith(otp: otp);
  }
}

final updatePasswordProvider =
    StateNotifierProvider<MyPasswordNotifier, MyPasswordUpdateModel>(
      (ref) => MyPasswordNotifier(),
    );
