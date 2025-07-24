// // To parse this JSON data, do
// //
// //     final registerResModel = registerResModelFromJson(jsonString);

// import 'dart:convert';

// RegisterResModel registerResModelFromJson(String str) => RegisterResModel.fromJson(json.decode(str));

// String registerResModelToJson(RegisterResModel data) => json.encode(data.toJson());

// class RegisterResModel {
//     String message;
//     User user;

//     RegisterResModel({
//         required this.message,
//         required this.user,
//     });

//     factory RegisterResModel.fromJson(Map<String, dynamic> json) => RegisterResModel(
//         message: json["message"],
//         user: User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "user": user.toJson(),
//     };
// }

// class User {
//     String name;
//     String email;
//     String categoryId;
//     String specialization;
//     String bio;
//     String languages;
//     List<String> sessionFee;
//     String rating;
//     String userType;
//     String phoneNumber;
//     String gender;
//     String dob;
//     DateTime updatedAt;
//     DateTime createdAt;
//     int id;
//     String token;

//     User({
//         required this.name,
//         required this.email,
//         required this.categoryId,
//         required this.specialization,
//         required this.bio,
//         required this.languages,
//         required this.sessionFee,
//         required this.rating,
//         required this.userType,
//         required this.phoneNumber,
//         required this.gender,
//         required this.dob,
//         required this.updatedAt,
//         required this.createdAt,
//         required this.id,
//         required this.token,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         name: json["name"],
//         email: json["email"],
//         categoryId: json["category_id"],
//         specialization: json["specialization"],
//         bio: json["bio"],
//         languages: json["languages"],
//         sessionFee: List<String>.from(json["session_fee"].map((x) => x)),
//         rating: json["rating"],
//         userType: json["user_type"],
//         phoneNumber: json["phone_number"],
//         gender: json["gender"],
//         dob: json["dob"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         id: json["id"],
//         token: json["token"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "email": email,
//         "category_id": categoryId,
//         "specialization": specialization,
//         "bio": bio,
//         "languages": languages,
//         "session_fee": List<dynamic>.from(sessionFee.map((x) => x)),
//         "rating": rating,
//         "user_type": userType,
//         "phone_number": phoneNumber,
//         "gender": gender,
//         "dob": dob,
//         "updated_at": updatedAt.toIso8601String(),
//         "created_at": createdAt.toIso8601String(),
//         "id": id,
//         "token": token,
//     };
// }

// To parse this JSON data, do
//
//     final registerResModel = registerResModelFromJson(jsonString);
import 'dart:convert';

UserBookingResModel userBookingResModelFromJson(String str) =>
    UserBookingResModel.fromJson(json.decode(str));

String userBookingResModelToJson(UserBookingResModel data) =>
    json.encode(data.toJson());

class UserBookingResModel {
  String? message;
  User? user;

  UserBookingResModel({
    this.message,
    this.user,
  });

  factory UserBookingResModel.fromJson(Map<String, dynamic> json) =>
      UserBookingResModel(
        message: json["message"],
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
      };
}

class User {
  String? name;
  String? email;
  String? categoryId;
  String? specialization;
  String? bio;
  String? languages;
  List<String>? sessionFee;
  String? rating;
  String? userType;
  String? profilePicture;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? token;

  User({
    this.name,
    this.email,
    this.categoryId,
    this.specialization,
    this.bio,
    this.languages,
    this.sessionFee,
    this.rating,
    this.userType,
    this.profilePicture,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        categoryId: json["category_id"],
        specialization: json["specialization"],
        bio: json["bio"],
        languages: json["languages"],
        sessionFee: json["session_fee"] != null
            ? List<String>.from(json["session_fee"].map((x) => x))
            : [],
        rating: json["rating"],
        userType: json["user_type"],
        profilePicture: json["profile_picture"],
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
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
        "session_fee":
            sessionFee != null ? List<dynamic>.from(sessionFee!.map((x) => x)) : [],
        "rating": rating,
        "user_type": userType,
        "profile_picture": profilePicture,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "token": token,
      };
}
