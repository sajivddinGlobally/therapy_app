import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:therapy_app/data/model/bookingsModel.dart';
import 'package:therapy_app/data/model/categoryModel.dart';
import 'package:therapy_app/data/model/doctorInfoModel.dart';
import 'package:therapy_app/data/model/loginBodyModel.dart';
import 'package:therapy_app/data/model/lognResModel.dart';
import 'package:therapy_app/data/model/accountModel.dart';
import 'package:therapy_app/data/model/mentalHealthavailabeModel.dart';
import 'package:therapy_app/data/model/passwordUpdateBodyModel.dart';
import 'package:therapy_app/data/model/passwordUpdateResModel.dart';
import 'package:therapy_app/data/model/sendOTPBodyModel.dart';
import 'package:therapy_app/data/model/sendOTPResModel.dart';

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
  Future<SendOTPResModel> sendOTP(@Body() SendOtoBodyModel body);

  @POST("/api/update-password")
  Future<PasswordUpdateResModel> updatePassword(
    @Body() PasswordUpdateBodyModel body,
  );

  @GET("/api/users/by-category?category=")
  Future<MentalHealthavailableModel> findAvailableTherapy(
    @Query("category") String query,
  );

  @GET("/api/bookings")
  Future<List<BookingsModel>> bookings();

  @MultiPart()
  @POST("/api/register")
  Future<HttpResponse> register({
    @Part(name: "name") required String name,
    @Part(name: "email") required String email,
    @Part(name: "password") required String password,
    @Part(name: "phone_number") required String phone,
    @Part(name: "gender") required String gender,
    @Part(name: "dob") required String dob,
    @Part(name: "category_id") required int categoryId,
    @Part(name: "specialization") required String specialization,
    @Part(name: "bio") required String bio,
    @Part(name: "languages") required String languages,
    @Part(name: "session_fee[]") required List<String> sessionFee,
    @Part(name: "rating") required String rating,
    @Part(name: "user_type") required String userType,
    @Part(name: "profile_picture") File? profilePicture,
  });

  // @MultiPart()
  // @POST("/api/user/profile/update")
  // Future<HttpResponse> updateProfile({
  //   @Part(name: "name") required String name,
  //   @Part(name: "email") required String email,
  //   @Part(name: "phone_number") required String phone,
  //   @Part(name: "gender") required String gender,
  //   @Part(name: "dob") required String dob,
  //   @Part(name: "profile_picture") File? profilePicutre,
  // });

  @GET("/api/users/by-category/{id}")
  Future<DoctorInfoModel> doctorInfo(@Path() String id);
}
