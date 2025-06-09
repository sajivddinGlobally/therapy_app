import 'package:therapy_app/data/model/lognResModel.dart';

abstract class LoginState {}

class LoginIntial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucess extends LoginState {
  final LoginResModel response;
  LoginSucess(this.response);
}

class LoginError extends LoginState {
  String message;
  LoginError(this.message);
}
