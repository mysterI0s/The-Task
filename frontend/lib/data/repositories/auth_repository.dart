import 'package:frontend/core/network/api_service.dart';
import 'package:frontend/data/models/login_model.dart';
import 'package:frontend/data/models/register_model.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<LoginModel> login(String email, String password) async {
    final data = await _apiService.post('/users/login', {
      "email": email,
      "password": password,
    });

    return LoginModel.fromJson(data);
  }

  Future<RegisterModel> register(
      String email,
      String firstName,
      String lastName,
      String phone,
      String password,
      String confirmPassword) async {
    try {
      final response = await _apiService.post('/users/signup', {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "user_type": "ADMIN",
        "password": password,
        "password_confirmation": confirmPassword,
      });


      return RegisterModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
