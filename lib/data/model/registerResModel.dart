// To parse this JSON data, do
//
//     final registerResModel = registerResModelFromJson(jsonString);

import 'dart:convert';

RegisterResModel registerResModelFromJson(String str) => RegisterResModel.fromJson(json.decode(str));

String registerResModelToJson(RegisterResModel data) => json.encode(data.toJson());

class RegisterResModel {
    String message;
    User user;

    RegisterResModel({
        required this.message,
        required this.user,
    });

    factory RegisterResModel.fromJson(Map<String, dynamic> json) => RegisterResModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    String name;
    String email;
    String categoryId;
    String specialization;
    String bio;
    String languages;
    List<String> sessionFee;
    String rating;
    String userType;
    DateTime updatedAt;
    DateTime createdAt;
    int id;
    String token;

    User({
        required this.name,
        required this.email,
        required this.categoryId,
        required this.specialization,
        required this.bio,
        required this.languages,
        required this.sessionFee,
        required this.rating,
        required this.userType,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
        required this.token,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        categoryId: json["category_id"],
        specialization: json["specialization"],
        bio: json["bio"],
        languages: json["languages"],
        sessionFee: List<String>.from(json["session_fee"].map((x) => x)),
        rating: json["rating"],
        userType: json["user_type"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "category_id": categoryId,
        "specialization": specialization,
        "bio": bio,
        "languages": languages,
        "session_fee": List<dynamic>.from(sessionFee.map((x) => x)),
        "rating": rating,
        "user_type": userType,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "token": token,
    };
}
