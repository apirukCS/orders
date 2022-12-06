// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "title_list_product_page": "ListProduct",
  "name_menu_setting_language": "Language",
  "setting_language": "SettingLanguage",
  "en": "English",
  "th": "Thai",
  "name_menu_filter": "Filter",
  "filter_product": "FilterProduct",
  "price_range": "PriceRange",
  "minimum_price": "MinimumPrice",
  "maximum_price": "MaximumPrice",
  "text_alert_price_range": "The highest price must be greater than the lowest price.",
  "text_alert_minimum_price": "The minimum price must be greater than 0.",
  "sort_price": "SortPrice",
  "not_specified": "NotSpecified",
  "descending": "Descending",
  "not_descending": "Ascending",
  "filter_clear": "Cleanup",
  "cancel": "Cancel",
  "confirm": "Confirm",
  "add_to_cart": "AddToCart",
  "has_product_in_cart": "This product is already in your cart.",
  "detail_product": "Detail product",
  "title_cart_page": "Cart",
  "order_product": "PlaceOrder",
  "title_dialog_remove_product_in_cart": "Remove products from cart.",
  "detail_dialog_remove_product_in_cart": "Are you sure?",
  "confirm_order": "Confirm to place order?"
};
static const Map<String,dynamic> th = {
  "title_list_product_page": "รายการสินค้า",
  "name_menu_setting_language": "ภาษา",
  "setting_language": "ตั้งค่าภาษา",
  "en": "อังกฤษ",
  "th": "ไทย",
  "name_menu_filter": "ตัวกรอง",
  "filter_product": "ตัวกรองข้อมูลสินค้า",
  "price_range": "ช่วงราคา",
  "minimum_price": "ราคาต่ำสุด",
  "maximum_price": "ราคาสูงสุด",
  "text_alert_price_range": "ราคาสูงสุดต้องมากกว่าราคาต่ำสุด",
  "text_alert_minimum_price": "ราคาขั้นต่ำต้องมากกว่าหรือเท่ากับ 0",
  "sort_price": "เรียงจากราคา",
  "not_specified": "ยังไม่ระบุ",
  "descending": "จากมากไปหาน้อย",
  "not_descending": "จากน้อยไปหามาก",
  "filter_clear": "ล้างข้อมูลที่เลือก",
  "cancel": "ยกเลิก",
  "confirm": "ยืนยัน",
  "add_to_cart": "เพิ่มไปยังรถเข็น",
  "has_product_in_cart": "มีสินค้านี้ในรถเข็นแล้ว",
  "detail_product": "รายละเอียดสินค้า",
  "title_cart_page": "รถเข็น",
  "order_product": "สั่งซื้อสินค้า",
  "title_dialog_remove_product_in_cart": "นำสินค้าออกจากรถเข็น",
  "detail_dialog_remove_product_in_cart": "คุณต้องการนำสินค้าออกจากรถเข็นใช่หรือไม่?",
  "confirm_order": "ยืนยันการสั่งซื้อสินค้า?"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "th": th};
}
