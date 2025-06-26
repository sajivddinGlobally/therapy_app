// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
    User user;

    AccountModel({
        required this.user,
    });

    factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    dynamic profilePicture;
    String token;
    DateTime createdAt;
    DateTime updatedAt;
    int categoryId;
    String specialization;
    String bio;
    dynamic languages;
    String rating;
    String userType;
    dynamic sessionFee;
    String phoneNumber;
    String gender;
    DateTime dob;

    User({
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

    factory User.fromJson(Map<String, dynamic> json) => User(
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
        sessionFee: json["session_fee"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
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
        "session_fee": sessionFee,
        "phone_number": phoneNumber,
        "gender": gender,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    };
}
