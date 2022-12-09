import 'package:flutter/material.dart';
import 'package:orders/model/user_model.dart';

class ApiUser {
  static Future<List<UserModel>> fetchAllUsers() async {
    return [
      UserModel(
        userId: 1,
        fullNameEn: "test1",
        fullNameTh: "ทดสอบ1",
        age: 20,
        address: "มหาสารคาม",
        phone: "0854447787",
        email: "test1@gmail.com",
        image:
            "https://static01.nyt.com/images/2022/05/10/science/28DOGS-BEHAVIOR1/28DOGS-BEHAVIOR1-mediumSquareAt3X-v2.jpg",
        password: "test1@password",
        permission: 1,
      ),
      UserModel(
        userId: 2,
        fullNameEn: "test2",
        fullNameTh: "ทดสอบ2",
        age: 18,
        address: "ขอนแก่น ซิตี้",
        phone: "0965557878",
        email: "test2@gmail.com",
        image:
            "https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-08/220805-border-collie-play-mn-1100-82d2f1.jpg",
        password: "test2@password",
        permission: 2,
      ),
      UserModel(
        userId: 3,
        fullNameEn: "test3",
        fullNameTh: "ทดสอบ3",
        age: 25,
        address: "ฝรั้ง ฝรั้งธนบุรี",
        phone: "068778454",
        email: "test3@gmail.com",
        image:
            "https://cdn.britannica.com/49/161649-131-5A595140/Bernese-mountain-dog-grass.jpg",
        password: "test3@password",
        permission: 1,
      ),
    ];
  }

  static Future<UserModel> getUserById(int id) async {
    List<UserModel> users = await fetchAllUsers();
    var contain = users.where((element) => element.userId == id);
    return contain.first;
  }
}
