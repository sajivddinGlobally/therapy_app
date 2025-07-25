// To parse this JSON data, do
//
//     final resheduleResModel = resheduleResModelFromJson(jsonString);

import 'dart:convert';

ResheduleResModel resheduleResModelFromJson(String str) => ResheduleResModel.fromJson(json.decode(str));

String resheduleResModelToJson(ResheduleResModel data) => json.encode(data.toJson());

class ResheduleResModel {
    bool status;
    String message;
    Data data;

    ResheduleResModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ResheduleResModel.fromJson(Map<String, dynamic> json) => ResheduleResModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    int userId;
    DateTime date;
    String timeSlot;
    String paymentMethod;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    String reason;
    String message;
    String therapistId;

    Data({
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
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    };
}
