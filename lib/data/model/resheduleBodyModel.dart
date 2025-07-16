// To parse this JSON data, do
//
//     final resheduleBodyModel = resheduleBodyModelFromJson(jsonString);

import 'dart:convert';

ResheduleBodyModel resheduleBodyModelFromJson(String str) => ResheduleBodyModel.fromJson(json.decode(str));

String resheduleBodyModelToJson(ResheduleBodyModel data) => json.encode(data.toJson());

class ResheduleBodyModel {
    int bookingId;
    DateTime date;
    String timeSlot;
    String reason;
    String message;

    ResheduleBodyModel({
        required this.bookingId,
        required this.date,
        required this.timeSlot,
        required this.reason,
        required this.message,
    });

    factory ResheduleBodyModel.fromJson(Map<String, dynamic> json) => ResheduleBodyModel(
        bookingId: json["booking_id"],
        date: DateTime.parse(json["date"]),
        timeSlot: json["time_slot"],
        reason: json["reason"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time_slot": timeSlot,
        "reason": reason,
        "message": message,
    };
}
