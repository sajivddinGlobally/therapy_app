import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  User? user; // ✅ CHANGED

  AccountModel({
    required this.user,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]), // ✅ CHANGED
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(), // ✅ CHANGED
      };
}

class User {
  int? id; // ✅ CHANGED
  String? name; // ✅ CHANGED
  String? email; // ✅ CHANGED
  dynamic emailVerifiedAt;
  dynamic profilePicture;
  String? token; // ✅ CHANGED
  DateTime? createdAt; // ✅ CHANGED
  DateTime? updatedAt; // ✅ CHANGED
  int? categoryId; // ✅ CHANGED
  String? specialization; // ✅ CHANGED
  String? bio; // ✅ CHANGED
  dynamic languages;
  String? rating; // ✅ CHANGED
  String? userType; // ✅ CHANGED
  dynamic sessionFee;
  String? phoneNumber; // ✅ CHANGED
  String? gender; // ✅ CHANGED
  DateTime? dob; // ✅ CHANGED

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
        id: json["id"], // ✅ CHANGED
        name: json["name"], // ✅ CHANGED
        email: json["email"], // ✅ CHANGED
        emailVerifiedAt: json["email_verified_at"],
        profilePicture: json["profile_picture"],
        token: json["token"], // ✅ CHANGED
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]), // ✅ CHANGED
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]), // ✅ CHANGED
        categoryId: json["category_id"], // ✅ CHANGED
        specialization: json["specialization"], // ✅ CHANGED
        bio: json["bio"], // ✅ CHANGED
        languages: json["languages"],
        rating: json["rating"], // ✅ CHANGED
        userType: json["user_type"], // ✅ CHANGED
        sessionFee: json["session_fee"],
        phoneNumber: json["phone_number"], // ✅ CHANGED
        gender: json["gender"], // ✅ CHANGED
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]), // ✅ CHANGED
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "profile_picture": profilePicture,
        "token": token,
        "created_at": createdAt?.toIso8601String(), // ✅ CHANGED
        "updated_at": updatedAt?.toIso8601String(), // ✅ CHANGED
        "category_id": categoryId,
        "specialization": specialization,
        "bio": bio,
        "languages": languages,
        "rating": rating,
        "user_type": userType,
        "session_fee": sessionFee,
        "phone_number": phoneNumber,
        "gender": gender,
        "dob": dob == null
            ? null
            : "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}", // ✅ CHANGED
      };
}
