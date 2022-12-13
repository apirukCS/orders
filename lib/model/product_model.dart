import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.productId,
    required this.productNameTh,
    required this.productNameEn,
    required this.price,
    required this.detailTh,
    required this.detailEn,
    required this.image,
  });

  final int productId;
  final String productNameTh;
  final String productNameEn;
  final int price;
  final String detailTh;
  final String detailEn;
  final String image;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["product_id"],
        productNameTh: json["product_name_th"],
        productNameEn: json["product_name_en"],
        price: json["price"],
        detailTh: json["detail_th"],
        detailEn: json["detail_en"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name_th": productNameTh,
        "product_name_en": productNameEn,
        "price": price,
        "detail_th": detailTh,
        "detail_en": detailEn,
        "image": image,
      };
}
