import 'dart:convert';

class UserModel {
  final String name;
  final String? photoUrl;

  UserModel({required this.name, required this.photoUrl});

  Map<String, dynamic> toMap() => {"name": name, "photoUrl": photoUrl};

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photoUrl: map['photoUrl']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));
}
