import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/api/api_product.dart';
import 'package:orders/model/product_model.dart';
import 'package:orders/pages/list_product/components/alert_filter_product.dart';
import 'package:orders/pages/list_product/components/alert_setting_language.dart';
import 'package:orders/pages/list_product/components/gridview_product.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({Key? key}) : super(key: key);

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  int minimumPrice = -1;
  int maximumPrice = -1;
  String isDescending = "";

  @override
  Widget build(BuildContext context) {
    isDescending = context.read<AppData>().isDescending;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_list_product_page.tr()),
        leading: Container(),
        leadingWidth: 0,
        actions: [
          InkWell(
            onTap: _onTapFilter,
            child: Row(
              children: [
                const Icon(Icons.filter_alt_outlined),
                Text(LocaleKeys.name_menu_filter.tr()),
              ],
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: _onTapSetting,
            child: Row(
              children: [
                const Icon(Icons.settings),
                Text(LocaleKeys.name_menu_setting_language.tr()),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: ApiProduct.fetchListAllProduct(),
          builder: (context, AsyncSnapshot<List<ProductModel>> products) {
            return GridViewProduct(
              products: products.data ?? [],
              isDescending: isDescending,
              maximumPrice: maximumPrice,
              minimumPrice: minimumPrice,
            );
          },
        ),
      ),
    );
  }

  void _onTapFilter() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertFilterProduct(
          isSelectedDescending: (callBack, min, max) {
            setState(() {
              isDescending = callBack;
              minimumPrice = min;
              maximumPrice = max;
            });
          },
        );
      },
    );
  }

  void _onTapSetting() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertSettingLanguage();
      },
    );
  }
}
