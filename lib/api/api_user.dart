import 'package:orders/model/user_model.dart';

class ApiUser{
  static Future<List<UserModel>> fetchAllUsers() async{
    return [
      UserModel(
          userId: 1,
          fullName: "ทดสอบ1",
          age: 20,
          address: "มหาสารคาม",
          phone: "0854447787",
          email: "test1@gmail.com",
          image: "",
          password: "test1@password",
          permission: 1
      ),
      UserModel(
          userId: 2,
          fullName: "ทดสอบ2",
          age: 18,
          address: "ขอนแก่น ซิตี้",
          phone: "0965557878",
          email: "test2@gmail.com",
          image: "",
          password: "test2@password",
          permission: 2
      ),
      UserModel(
          userId: 3,
          fullName: "ทดสอบ3",
          age: 25,
          address: "ฝรั้ง ฝรั้งธนบุรี",
          phone: "068778454",
          email: "test3@gmail.com",
          image: "",
          password: "test3@password",
          permission: 1
      ),
    ];
  }
}