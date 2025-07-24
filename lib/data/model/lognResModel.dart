// // To parse this JSON data, do
// //
// //     final loginResModel = loginResModelFromJson(jsonString);

// import 'dart:convert';

// LoginResModel loginResModelFromJson(String str) =>
//     LoginResModel.fromJson(json.decode(str));

// String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

// class LoginResModel {
//   String message;
//   User user;

//   LoginResModel({required this.message, required this.user});

//   factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
//     message: json["message"],
//     user: User.fromJson(json["user"]),
//   );

//   Map<String, dynamic> toJson() => {"message": message, "user": user.toJson()};
// }

// class User {
//   int id;
//   String name;
//   String email;
//   dynamic emailVerifiedAt;
//   String? profilePicture;
//   String token;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int categoryId;
//   String specialization;
//   String bio;
//   String? languages;
//   String rating;
//   String userType;
//   List<String>? sessionFee;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     this.emailVerifiedAt,
//     this.profilePicture,
//     required this.token,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.categoryId,
//     required this.specialization,
//     required this.bio,
//     this.languages,
//     required this.rating,
//     required this.userType,
//     this.sessionFee,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//   id: json["id"],
//   name: json["name"],
//   email: json["email"],
//   emailVerifiedAt: json["email_verified_at"],
//   profilePicture: json["profile_picture"],
//   token: json["token"],
//   createdAt: DateTime.parse(json["created_at"]),
//   updatedAt: DateTime.parse(json["updated_at"]),
//   categoryId: json["category_id"],
//   specialization: json["specialization"],
//   bio: json["bio"],
//   languages: json["languages"],
//   rating: json["rating"],
//   userType: json["user_type"],

//   // ✅ FIXED: null check added here
//   sessionFee: json["session_fee"] != null
//       ? List<String>.from(json["session_fee"].map((x) => x))
//       : [],
// );


//  Map<String, dynamic> toJson() => {
//   "id": id,
//   "name": name,
//   "email": email,
//   "email_verified_at": emailVerifiedAt,
//   "profile_picture": profilePicture,
//   "token": token,
//   "created_at": createdAt.toIso8601String(),
//   "updated_at": updatedAt.toIso8601String(),
//   "category_id": categoryId,
//   "specialization": specialization,
//   "bio": bio,
//   "languages": languages,
//   "rating": rating,
//   "user_type": userType,

//   // ✅ FIXED: null check before mapping
//   "session_fee": sessionFee != null
//       ? List<dynamic>.from(sessionFee!.map((x) => x))
//       : [],
// };

// }

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) =>
    LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) =>
    json.encode(data.toJson());

class LoginResModel {
  String? message;
  User? user;

  LoginResModel({
    this.message,
    this.user,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        message: json["message"],
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? profilePicture;
  String? token;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? categoryId;
  String? specialization;
  String? bio;
  String? languages;
  String? rating;
  String? userType;
  List<String>? sessionFee;
  dynamic phoneNumber;
  dynamic gender;
  dynamic dob;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.profilePicture,
    this.token,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.specialization,
    this.bio,
    this.languages,
    this.rating,
    this.userType,
    this.sessionFee,
    this.phoneNumber,
    this.gender,
    this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        profilePicture: json["profile_picture"],
        token: json["token"],
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
        categoryId: json["category_id"],
        specialization: json["specialization"],
        bio: json["bio"],
        languages: json["languages"],
        rating: json["rating"],
        userType: json["user_type"],
        sessionFee: json["session_fee"] != null
            ? List<String>.from(json["session_fee"].map((x) => x))
            : [],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category_id": categoryId,
        "specialization": specialization,
        "bio": bio,
        "languages": languages,
        "rating": rating,
        "user_type": userType,
        "session_fee": sessionFee != null
            ? List<dynamic>.from(sessionFee!.map((x) => x))
            : [],
        "phone_number": phoneNumber,
        "gender": gender,
        "dob": dob,
      };
}
