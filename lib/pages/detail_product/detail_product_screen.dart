import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/model/product_model.dart';
import 'package:orders/pages/detail_product/components/detail_product.dart';
import 'package:orders/pages/detail_product/components/top_bar.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/sizes/sizes.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/alert.dart';
import 'package:orders/widgets/full_button.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({
    Key? key,
    required this.product,
    required this.onTabAddProductToCart,
  }) : super(key: key);

  final ProductModel product;

  final VoidCallback onTabAddProductToCart;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  double paddingLeft = 10;
  double paddingTop = 0;

  double imgW = 150;
  double imgH = 100;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        paddingTop = displayHeight(context) - 200;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: displayHeight(context),
            child: ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  width: double.infinity,
                  height: h * 0.35,
                  child: Stack(
                    children: [
                      Image.network(
                        widget.product.image,
                        width: double.infinity,
                        height: h * 0.35,
                        fit: BoxFit.fill,
                      ),
                      TopBar(
                        onTap: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DetailProduct(
                    product: widget.product,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: _onTapAddProductToCart,
              child: SizedBox(
                width: w,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: FullButton(
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white70,
                    ),
                    text: LocaleKeys.add_to_cart.tr(),
                    textColor: Colors.white70,
                    background: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapAddProductToCart() {
    int proId = widget.product.productId;
    var contain = context
        .read<AppData>()
        .products
        .where((element) => element.productId == proId);
    if (contain.isEmpty) {
      context.read<AppData>().products.add(widget.product);
      widget.onTabAddProductToCart();
      setState(() {});
    } else {
      Alert.alertDialog(
        context,
        "\n${LocaleKeys.has_product_in_cart.tr()}",
        "",
        DialogType.noHeader,
        () {},
      );
    }
  }
}
