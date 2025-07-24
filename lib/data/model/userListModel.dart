// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
    bool status;
    String therapistId;
    int totalBookings;
    List<Booking> bookings;

    UserListModel({
        required this.status,
        required this.therapistId,
        required this.totalBookings,
        required this.bookings,
    });

    factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        status: json["status"],
        therapistId: json["therapist_id"],
        totalBookings: json["total_bookings"],
        bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "therapist_id": therapistId,
        "total_bookings": totalBookings,
        "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
    };
}

class Booking {
    int id;
    int userId;
    DateTime date;
    String timeSlot;
    String paymentMethod;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic reason;
    dynamic message;
    int therapistId;
    User user;

    Booking({
        required this.id,
        required this.userId,
        required this.date,
        required this.timeSlot,
        required this.paymentMethod,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.reason,
        required this.message,
        required this.therapistId,
        required this.user,
    });

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        userId: json["user_id"],
        date: DateTime.parse(json["date"]),
        timeSlot: json["time_slot"],
        paymentMethod: json["payment_method"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        reason: json["reason"],
        message: json["message"],
        therapistId: json["therapist_id"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time_slot": timeSlot,
        "payment_method": paymentMethod,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "reason": reason,
        "message": message,
        "therapist_id": therapistId,
        "user": user.toJson(),
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
    String? languages;
    String rating;
    String userType;
    List<String>? sessionFee;
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
        sessionFee: json["session_fee"] == null ? [] : List<String>.from(json["session_fee"]!.map((x) => x)),
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
        "session_fee": sessionFee == null ? [] : List<dynamic>.from(sessionFee!.map((x) => x)),
        "phone_number": phoneNumber,
        "gender": gender,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    };
}
