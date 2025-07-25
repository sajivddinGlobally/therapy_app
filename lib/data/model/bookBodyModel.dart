// // To parse this JSON data, do
// //
// //     final bookBodyModel = bookBodyModelFromJson(jsonString);

// import 'dart:convert';

// BookBodyModel bookBodyModelFromJson(String str) =>
//     BookBodyModel.fromJson(json.decode(str));

// String bookBodyModelToJson(BookBodyModel data) => json.encode(data.toJson());

// class BookBodyModel {
//   String status;
//   DateTime date;
//   String timeSlot;
//   String paymentMethod;
//   String therapist_id;

//   BookBodyModel({
//     required this.status,
//     required this.date,
//     required this.timeSlot,
//     required this.paymentMethod,
//     required this.therapist_id,
//   });

//   factory BookBodyModel.fromJson(Map<String, dynamic> json) => BookBodyModel(
//     status: json["status"],
//     date: DateTime.parse(json["date"]),
//     timeSlot: json["time_slot"],
//     paymentMethod: json["payment_method"],
//     therapist_id: '',
//   );

//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "date":
//         "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//     "time_slot": timeSlot,
//     "payment_method": paymentMethod,
//   };
// }

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
    String therapistId;

    BookBodyModel({
        required this.status,
        required this.date,
        required this.timeSlot,
        required this.paymentMethod,
        required this.therapistId,
    });

    factory BookBodyModel.fromJson(Map<String, dynamic> json) => BookBodyModel(
        status: json["status"],
        date: DateTime.parse(json["date"]),
        timeSlot: json["time_slot"],
        paymentMethod: json["payment_method"],
        therapistId: json["therapist_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time_slot": timeSlot,
        "payment_method": paymentMethod,
        "therapist_id": therapistId,
    };
}
