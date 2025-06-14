import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:therapy_app/data/model/categoryModel.dart';
import 'package:therapy_app/data/model/loginBodyModel.dart';
import 'package:therapy_app/data/model/lognResModel.dart';
import 'package:therapy_app/data/model/accountModel.dart';
import 'package:therapy_app/data/model/passUpdateSuccBodyModel.dart';
import 'package:therapy_app/data/model/passUpdateSuccResModel.dart';
import 'package:therapy_app/data/model/updatePasswordBodyModel.dart';
import 'package:therapy_app/data/model/updatePasswordResModel.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: 'https://therapy.education.globallywebsolutions.com')
abstract class ApiStateNetwork {
  factory ApiStateNetwork(Dio dio, {String baseUrl}) = _ApiStateNetwork;

  @POST('/api/login')
  Future<LoginResModel> login(@Body() LoginBodyModel body);

  @GET('/api/categories')
  Future<CategoryModel> getCategory();

  @GET("/api/user/profile")
  Future<AccountModel> account();

  @POST("/api/send-password-update-otp")
  Future<UpdatePasswordResModel> updateSendOtp(
    @Body() UpdatePasswordBodyModel body,
  );

  @POST("/api/update-password")
  Future<PassUpdateResSuccModel> passwordUpdate(
    @Body() PassUpdateBodySuccModel body,
  );
}
