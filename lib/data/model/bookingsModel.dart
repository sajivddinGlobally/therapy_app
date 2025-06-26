// To parse this JSON data, do
//
//     final bookingsModel = bookingsModelFromJson(jsonString);

import 'dart:convert';

List<BookingsModel> bookingsModelFromJson(String str) => List<BookingsModel>.from(json.decode(str).map((x) => BookingsModel.fromJson(x)));

String bookingsModelToJson(List<BookingsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingsModel {
    int bookingId;
    String userName;
    DateTime date;
    String time;
    String paymentMethod;
    String status;

    BookingsModel({
        required this.bookingId,
        required this.userName,
        required this.date,
        required this.time,
        required this.paymentMethod,
        required this.status,
    });

    factory BookingsModel.fromJson(Map<String, dynamic> json) => BookingsModel(
        bookingId: json["booking_id"],
        userName: json["user_name"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        paymentMethod: json["payment_method"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "user_name": userName,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "payment_method": paymentMethod,
        "status": status,
    };
}
