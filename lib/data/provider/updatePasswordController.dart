import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/passwordUpdateBodyModel.dart';
import 'package:therapy_app/data/model/sendOTPBodyModel.dart';

class forgotPasswordController extends StateNotifier<AsyncValue<String>> {
  //final ApiService api;
  forgotPasswordController() : super(AsyncValue.data(""));

  Future<void> sendOTP(String emal) async {
    state = AsyncValue.loading();
    try {
      final service = ApiStateNetwork(createDio());
      final body = SendOtoBodyModel(email: emal);
      final response = await service.sendOTP(body);
      state = AsyncValue.data(response.message);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updatePassword(
    String email,
    String otp,
    String newpassword,
    String confirmpassword,
  ) async {
    state = AsyncValue.loading();

    try {
      final service = ApiStateNetwork(createDio());
      final body = PasswordUpdateBodyModel(
        email: email,
        otp: otp,
        password: newpassword,
        passwordConfirmation: confirmpassword,
      );
      final respo = service.updatePassword(body);

      state = AsyncValue.data(respo.toString());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final updataProvider = StateNotifierProvider(
  (ref) => forgotPasswordController(),
);
