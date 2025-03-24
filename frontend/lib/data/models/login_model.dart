class LoginModel {
  final String token;
  final String refreshToken;
  final User user;

  LoginModel({
    required this.token,
    required this.refreshToken,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      refreshToken: json['refresh_token'],
      user: User.fromJson(json['user']), // Fixed user parsing
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'refresh_token': refreshToken,
      'user': user.toJson(), // Convert user to JSON
    };
  }
}

class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String userType;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.userType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      userType: json['user_type'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "user_type": userType,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
    };
  }
}
