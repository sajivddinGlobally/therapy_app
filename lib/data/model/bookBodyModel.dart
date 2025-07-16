// To parse this JSON data, do
//
//     final bookBodyModel = bookBodyModelFromJson(jsonString);

import 'dart:convert';

BookBodyModel bookBodyModelFromJson(String str) => BookBodyModel.fromJson(json.decode(str));

String bookBodyModelToJson(BookBodyModel data) => json.encode(data.toJson());

class BookBodyModel {
    String status;
    DateTime date;
    String timeSlot;
    String paymentMethod;

    BookBodyModel({
        required this.status,
        required this.date,
        required this.timeSlot,
        required this.paymentMethod,
    });

    factory BookBodyModel.fromJson(Map<String, dynamic> json) => BookBodyModel(
        status: json["status"],
        date: DateTime.parse(json["date"]),
        timeSlot: json["time_slot"],
        paymentMethod: json["payment_method"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time_slot": timeSlot,
        "payment_method": paymentMethod,
    };
}
