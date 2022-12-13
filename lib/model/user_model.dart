import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.fullNameEn,
    required this.fullNameTh,
    required this.age,
    required this.address,
    required this.phone,
    required this.email,
    required this.image,
    required this.password,
    required this.permission,
  });

  final int userId;
  final String fullNameEn;
  final String fullNameTh;
  final int age;
  final String address;
  final String phone;
  final String email;
  final String password;
  final String image;
  final int permission;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        fullNameEn: json["full_name_en"],
        fullNameTh: json["full_name_th"],
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
        "full_name_en": fullNameEn,
        "full_name_th": fullNameTh,
        "age": age,
        "address": address,
        "phone": phone,
        "email": email,
        "password": password,
        "image": image,
        "permission": permission,
      };
}
