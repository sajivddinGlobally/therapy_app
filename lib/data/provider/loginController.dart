import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/loginBodyModel.dart';
import 'package:therapy_app/data/provider/login.state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginIntial());

  //login method
  Future<void> login(LoginBodyModel body) async {
    log("Login process started");

    try {
      state = LoginLoading();
      //initial login and login service
      final dio = await createDio();
      final apistatenetwork = ApiStateNetwork(dio);
      final response = await apistatenetwork.login(body);

      var box = Hive.box("data");
      await box.put("id", response.user!.id);
      await box.put("name", response.user!.name);
      await box.put("email", response.user!.email);
      await box.put("token", response.user!.token);
      await box.put("profile_picturee", response.user!.profilePicture);

      //set state the success to the response
      state = LoginSuccess(response);
      log("Login Successful : ${response.message}");
    } catch (e) {
      // handle error and set the state error
      state = LoginError(e.toString());
      log(e.toString());
    }
  }
}

//statenotifier provider to loginControlelr
final logincontrollerprovider =
    StateNotifierProvider<LoginController, LoginState>(
      (ref) => LoginController(),
    );
