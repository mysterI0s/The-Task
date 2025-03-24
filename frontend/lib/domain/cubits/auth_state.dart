import 'package:frontend/data/models/login_model.dart';
import 'package:frontend/data/models/register_model.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final LoginModel model;
  LoginSuccessState(this.model);
}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final RegisterModel model;
  RegisterSuccessState(this.model);
}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}

