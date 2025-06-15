import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:therapy_app/Screen/login.page.dart';
import 'package:therapy_app/core/network/api.state.dart';
import 'package:therapy_app/core/utils/pretty.dio.dart';
import 'package:therapy_app/data/model/passUpdateSuccBodyModel.dart';
import 'package:therapy_app/data/model/passUpdateSuccResModel.dart';
import 'package:therapy_app/data/model/updatePasswordBodyModel.dart';
import 'package:therapy_app/data/model/updatePasswordResModel.dart';

final updatePasswordControlelr =
    FutureProvider.family<UpdatePasswordResModel, UpdatePasswordBodyModel>((
      ref,
      body,
    ) async {
      final updateSendService = ApiStateNetwork(createDio());
      return await updateSendService.updateSendOtp(body);
    });

final sendOtpProvider =
    FutureProvider.family<UpdatePasswordResModel, UpdatePasswordBodyModel>((
      ref,
      body,
    ) async {
      final update = ApiStateNetwork(createDio());
      return await update.updateSendOtp(body);
    });

final verifyOtpProvider =
    FutureProvider.family<PassUpdateResSuccModel, PassUpdateBodySuccModel>((
      ref,
      body,
    ) async {
      final verfyservice = ApiStateNetwork(createDio());
      return verfyservice.passwordUpdate(body);
    });
