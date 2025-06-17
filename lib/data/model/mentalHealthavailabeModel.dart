// To parse this JSON data, do
//
//     final mentalHealthavailableModel = mentalHealthavailableModelFromJson(jsonString);

import 'dart:convert';

MentalHealthavailableModel mentalHealthavailableModelFromJson(String str) => MentalHealthavailableModel.fromJson(json.decode(str));

String mentalHealthavailableModelToJson(MentalHealthavailableModel data) => json.encode(data.toJson());

class MentalHealthavailableModel {
    String category;
    List<User> users;

    MentalHealthavailableModel({
        required this.category,
        required this.users,
    });

    factory MentalHealthavailableModel.fromJson(Map<String, dynamic> json) => MentalHealthavailableModel(
        category: json["category"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String? profilePicture;
    String token;
    DateTime createdAt;
    DateTime updatedAt;
    int categoryId;
    String specialization;
    String bio;
    String languages;
    String rating;
    String userType;
    List<String> sessionFee;
    Category category;

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
        required this.category,
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
        sessionFee: List<String>.from(json["session_fee"].map((x) => x)),
        category: Category.fromJson(json["category"]),
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
        "category": category.toJson(),
    };
}

class Category {
    int id;
    String name;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    Category({
        required this.id,
        required this.name,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
