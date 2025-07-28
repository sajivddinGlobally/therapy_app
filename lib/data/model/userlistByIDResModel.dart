// To parse this JSON data, do
//
//     final userListByIdModel = userListByIdModelFromJson(jsonString);

import 'dart:convert';

UserListByIdModel userListByIdModelFromJson(String str) =>
    UserListByIdModel.fromJson(json.decode(str));

String userListByIdModelToJson(UserListByIdModel data) =>
    json.encode(data.toJson());

class UserListByIdModel {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String? profilePicture;
  String? token;
  DateTime createdAt;
  DateTime updatedAt;
  int categoryId;
  String? specialization;
  String? bio;
  String? languages;
  String? rating;
  String? userType;
  List<String> sessionFee;
  dynamic phoneNumber;
  dynamic gender;
  dynamic dob;

  UserListByIdModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.profilePicture,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
    required this.specialization,
    required this.bio,
    required this.languages,
    required this.rating,
    required this.userType,
    required this.sessionFee,
    required this.phoneNumber,
    required this.gender,
    required this.dob,
  });

  factory UserListByIdModel.fromJson(Map<String, dynamic> json) =>
      UserListByIdModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        profilePicture: json["profile_picture"],
        token: json["token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"],
        specialization: json["specialization"],
        bio: json["bio"],
        languages: json["languages"],
        rating: json["rating"],
        userType: json["user_type"],
        // sessionFee: List<String>.from(json["session_fee"].map((x) => x)),
        sessionFee:
            (json["session_fee"] as List?)?.map((x) => x.toString()).toList() ??
            [],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "profile_picture": profilePicture,
    "token": token,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category_id": categoryId,
    "specialization": specialization,
    "bio": bio,
    "languages": languages,
    "rating": rating,
    "user_type": userType,
    "session_fee": List<dynamic>.from(sessionFee.map((x) => x)),
    "phone_number": phoneNumber,
    "gender": gender,
    "dob": dob,
  };
}
