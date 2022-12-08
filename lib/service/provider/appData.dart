import 'package:flutter/material.dart';
import 'package:orders/enums/sort_by_price.dart';
import 'package:orders/model/product_model.dart';

class AppData with ChangeNotifier {
  //current user
  int userId = 0;

  List<ProductModel> products = [];

  //สำหรับการกรองข้อมูลสินค้า
  int minimumPrice = -1;
  int maximumPrice = -1;

  String isDescending = SortByPrice.NotSpecified.enumToString();

  notifyChange() {
    notifyListeners();
  }
}
