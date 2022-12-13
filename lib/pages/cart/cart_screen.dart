import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/pages/cart/components/listtile_product_in_cart.dart';
import 'package:orders/pages/list_product/list_product_screen.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/sizes/sizes.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/alert.dart';
import 'package:orders/widgets/full_button.dart';
import 'package:orders/widgets/icon_back.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);

    int countProduct = context.read<AppData>().products.length;

    return Scaffold(
      appBar: AppBar(
        leading: const IconBack(),
        title: Text("${LocaleKeys.title_cart_page.tr()}($countProduct)"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 70),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: context.read<AppData>().products.length,
          itemBuilder: (context, index) {
            return ListTileProductInCart(
              product: context.read<AppData>().products[index],
              onTapRemove: () {
                _onTapRemove();
              },
            );
          },
        ),
      ),
      bottomSheet: InkWell(
        onTap: _onTapByProduct,
        child: SizedBox(
          width: w,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FullButton(
              text: LocaleKeys.order_product.tr(),
              textColor: Colors.white70,
              background: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  void _onTapByProduct() {
    Alert.alertDialog(
      context,
      "\n${LocaleKeys.confirm_order.tr()}",
      "",
      DialogType.noHeader,
      _onConfirmBuyProduct
    );
  }

  void _onConfirmBuyProduct() {
    context.read<AppData>().products = [];
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ListProductScreen(),
      ),
    );
  }

  void _onTapRemove() {
    setState(() {});
  }
}
