import 'package:therapy_app/data/model/lognResModel.dart';

abstract class LoginState {}

class LoginIntial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResModel response;
  LoginSuccess(this.response);
}

class LoginError extends LoginState {
  String message;
  LoginError(this.message);
}
