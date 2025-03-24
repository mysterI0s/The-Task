class RegisterModel {
  final String insertedID;

  RegisterModel({required this.insertedID});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      insertedID: json['InsertedID'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {"InsertedID": insertedID};
  }
}
