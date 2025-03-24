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
      token: json['token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      user:
          User.fromJson(json), // Pass entire JSON since fields are at the root
    );
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
      userId:
          json['user_id'] ?? json['ID'] ?? '', // Handle both "user_id" and "ID"
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      userType: json['user_type'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }
}

