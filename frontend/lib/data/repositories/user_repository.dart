import 'dart:convert';
import 'package:frontend/core/constants/app_consts.dart';
import 'package:frontend/data/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class UserRepository {
  final box = GetStorage();

  Future<List<User>> fetchUsers() async {
    final String? token = box.read(AppConst.accessToken);

    if (token == null || token.isEmpty) {
      throw Exception("Unauthorized: No access token found.");
    }

    try {
      final response = await http.get(
        Uri.parse("${AppConst.baseUrl}/users"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          throw Exception("Empty response received.");
        }

        // Decode response into a Map
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Extract the list of users from the map
        if (!jsonData.containsKey('users') || jsonData['users'] == null) {
          throw Exception("Invalid response format: Missing 'users' key.");
        }

        final List<dynamic> usersList = jsonData['users'];

        // Convert list to User objects
        return usersList.map((json) => User.fromJson(json)).toList();
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized: Invalid token.");
      } else if (response.statusCode == 403) {
        throw Exception("Forbidden: You do not have access.");
      } else {
        throw Exception(
            "Failed to load users: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception(
          "An error occurred while fetching users: ${e.toString()}");
    }
  }
}
