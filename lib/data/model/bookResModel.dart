// To parse this JSON data, do
//
//     final bookResModel = bookResModelFromJson(jsonString);

import 'dart:convert';

BookResModel bookResModelFromJson(String str) => BookResModel.fromJson(json.decode(str));

String bookResModelToJson(BookResModel data) => json.encode(data.toJson());

class BookResModel {
    String message;
    Booking booking;

    BookResModel({
        required this.message,
        required this.booking,
    });

    factory BookResModel.fromJson(Map<String, dynamic> json) => BookResModel(
        message: json["message"],
        booking: Booking.fromJson(json["booking"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "booking": booking.toJson(),
    };
}

class Booking {
    int userId;
    DateTime date;
    String timeSlot;
    String paymentMethod;
    String status;
    String therapistId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Booking({
        required this.userId,
        required this.date,
        required this.timeSlot,
        required this.paymentMethod,
        required this.status,
        required this.therapistId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        userId: json["user_id"],
        date: DateTime.parse(json["date"]),
        timeSlot: json["time_slot"],
        paymentMethod: json["payment_method"],
        status: json["status"],
        therapistId: json["therapist_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time_slot": timeSlot,
        "payment_method": paymentMethod,
        "status": status,
        "therapist_id": therapistId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
