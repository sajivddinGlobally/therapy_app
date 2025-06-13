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
          'Authorization': 'Bearer $token',
          if (token != null) 'Authorization': 'Bearer $token',
        });
        handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          log(error.response.toString());
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
          return handler.next(error);
        }
      },
    ),
  );
  return dio;
}
