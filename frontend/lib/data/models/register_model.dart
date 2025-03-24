import 'package:frontend/data/models/login_model.dart';

class RegisterModel {
  final String message;
  final User user;

  RegisterModel({required this.message, required this.user});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }
}
