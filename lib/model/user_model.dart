// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.fullName,
    required this.age,
    required this.address,
    required this.phone,
    required this.email,
    required this.image,
    required this.password,
    required this.permission,
  });

  final int userId;
  final String fullName;
  final int age;
  final String address;
  final String phone;
  final String email;
  final String password;
  final String image;
  final int permission;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["user_id"],
    fullName: json["full_name"],
    age: json["age"],
    address: json["address"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    image: json["image"],
    permission: json["permission"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "full_name": fullName,
    "age": age,
    "address": address,
    "phone": phone,
    "email": email,
    "password": password,
    "image": image,
    "permission": permission,
  };
}
