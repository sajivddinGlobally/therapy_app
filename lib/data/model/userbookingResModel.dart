// To parse this JSON data, do
//
//     final userBookingResModel = userBookingResModelFromJson(jsonString);

import 'dart:convert';

List<UserBookingResModel> userBookingResModelFromJson(String str) => List<UserBookingResModel>.from(json.decode(str).map((x) => UserBookingResModel.fromJson(x)));

String userBookingResModelToJson(List<UserBookingResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserBookingResModel {
    int bookingId;
    String therapistName;
    DateTime date;
    String time;
    String status;
    String paymentMethod;

    UserBookingResModel({
        required this.bookingId,
        required this.therapistName,
        required this.date,
        required this.time,
        required this.status,
        required this.paymentMethod,
    });

    factory UserBookingResModel.fromJson(Map<String, dynamic> json) => UserBookingResModel(
        bookingId: json["booking_id"],
        therapistName: json["therapist_name"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        paymentMethod: json["payment_method"],
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "therapist_name": therapistName,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
        "payment_method": paymentMethod,
    };
}
