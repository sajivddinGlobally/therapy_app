import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:therapy_app/data/model/categoryModel.dart';
import 'package:therapy_app/data/model/loginBodyModel.dart';
import 'package:therapy_app/data/model/lognResModel.dart';
import 'package:therapy_app/data/model/accountModel.dart';
import 'package:therapy_app/data/model/mentalHealthavailabeModel.dart';
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

  @GET("/api/users/by-category?category=")
  Future<MentalHealthavailableModel> findAvailableTherapy(
    @Query("category") String query,
  );

  
  @POST("/api/register")
@MultiPart()
Future<HttpResponse> register({
  @Part(name: "name") required String name,
  @Part(name: "email") required String email,
  @Part(name: "password") required String password,
  @Part(name: "category_id") required int categoryId,
  @Part(name: "specialization") required String specialization,
  @Part(name: "bio") required String bio,
  @Part(name: "languages") required String languages,
  @Part(name: "session_fee[]") required List<String> sessionFee,
  @Part(name: "rating") required String rating,
  @Part(name: "user_type") required String userType,
 // @Part(name: "profile_picture") MultipartFile profilePicture,
});
}
