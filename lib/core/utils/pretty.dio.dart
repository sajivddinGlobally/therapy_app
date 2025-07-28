import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:therapy_app/Screen/login.page.dart';
import 'package:therapy_app/core/utils/globalKey.dart';

Dio createDio() {
  final dio = Dio();

  // Logging interceptor
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  var box = Hive.box("data");
  var token = box.get("token");

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({
          // 'Content-Type': 'application/json',
          'Accept': 'application/json',
          //'Authorization': 'Bearer $token',
          if (token != null) 'Authorization': 'Bearer $token',
        });
        handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        if (e.requestOptions.path.contains("/api/login")) {
          /// ye line sirf login agar wrong ho to sirf invalid emal or password message show karega
          log("Invalid email or passworld");
          handler.next(e);
          return;
        }
        if (e.response?.statusCode == 401) {
          log(e.response.toString());
          Fluttertoast.showToast(
            msg: "Token expire please login",
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.red,
            textColor: Color(0xFFFFFFFF),
          );
          navigatorKey.currentState?.pushAndRemoveUntil(
            CupertinoPageRoute(builder: (_) => LoginPage()),
            (_) => false,
          );
          return handler.next(e);
        }

        // if (e.response!.statusCode == 422) {
        //   log(e.response!.data["error"]);
        //   Fluttertoast.showToast(msg: e.response!.data["error"]);
        // }
        if ([400, 422, 403].contains(e.response?.statusCode)) {
          final data = e.response?.data;
          String errorMessage = "Something went wrong";

          if (data is Map<String, dynamic>) {
            if (data.containsKey('message')) {
              errorMessage = data['message'];
            } else if (data.containsKey('error')) {
              final error = data['error'];
              if (error is String) {
                errorMessage = error;
              } else if (error is Map<String, dynamic>) {
                errorMessage = error.entries
                    .map((e) => (e.value as List).join(", "))
                    .join("\n");
              }
            }
            // ✅✅ ✅ NEW: HANDLE "errors" KEY FROM SERVER ✅✅✅
            else if (data.containsKey('errors')) {
              final errors = data['errors'];
              if (errors is Map<String, dynamic>) {
                errorMessage = errors.entries
                    .map((e) => (e.value as List).join(", "))
                    .join("\n");
              }
            }
          }

          Fluttertoast.showToast(
            msg: errorMessage,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
        log("Dio error: ${e.message}");
        return handler.next(e);
      },
    ),
  );
  return dio;
}
