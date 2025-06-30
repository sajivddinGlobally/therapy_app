import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:therapy_app/constant/myColor.dart';

class UpdateProfileController {
  static Future<Map<String, dynamic>> profileUpdate({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String dob,
    required File? profile_picture,
  }) async {
    final Uri url = Uri.parse(
      "http://therapy.education.globallywebsolutions.com/api/user/profile/update",
    );

    var box = Hive.box("data");
    var token = box.get("token");

    var request = http.MultipartRequest("POST", url);
    request.headers.addAll({
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    });

    // ✅ safe image upload
    if (profile_picture != null) {
      if (await profile_picture.exists()) {
        log("✅ Uploading image: ${profile_picture.path}");
        request.files.add(
          await http.MultipartFile.fromPath(
            'profile_picture',
            profile_picture.path,
          ),
        );
      } else {
        log("❌ Image file does not exist at path: ${profile_picture.path}");
        Fluttertoast.showToast(
          msg: "Image file not found, skipping image upload",
        );
      }
    } else {
      log("⚠️ No image selected, skipping image upload");
    }

    request.fields.addAll({
      "name": name,
      "email": email,
      "phone_number": phone,
      "gender": gender,
      "dob": dob,
    });

    try {
      final http.StreamedResponse response = await request.send();
      final responsebody = await response.stream.bytesToString();
      Map<String, dynamic> data = jsonDecode(responsebody);
      log(responsebody);
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: "Profile Update Successful",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: buttonColor,
          textColor: Colors.white,
        );
        Navigator.pop(context, true);
        return data;
      } else {
        // ✅ show proper API error message
        String? errorMessage;

        if (data["error"] != null) {
          errorMessage = data["error"].toString();
        } else if (data["message"] != null) {
          errorMessage = data["message"].toString();
        } else {
          errorMessage = response.reasonPhrase ?? "Something went wrong";
        }
        Fluttertoast.showToast(
          msg: errorMessage,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );

        throw Exception("Failed to Upload: $errorMessage");
      }
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
