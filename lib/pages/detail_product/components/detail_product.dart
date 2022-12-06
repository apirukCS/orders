import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/model/product_model.dart';
import 'package:orders/translations/locale_keys.g.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Localizations.localeOf(context).languageCode == "th"
                ? "${product.productNameTh} "
                : "${product.productNameEn} ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "฿ ${product.price}",
            style: TextStyle(
              color: Colors.red.shade500,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            LocaleKeys.detail_product.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Localizations.localeOf(context).languageCode == "th"
                  ? product.detailTh
                  : product.detailEn,
            ),
          ),
        ],
      ),
    );
  }
}
