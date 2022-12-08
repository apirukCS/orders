import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/model/product_model.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/sizes/sizes.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/awesome_dialog.dart';
import 'package:provider/provider.dart';

class ListTileProductInCart extends StatefulWidget {
  const ListTileProductInCart({
    Key? key,
    required this.product,
    required this.onTapRemove,
  }) : super(key: key);

  final ProductModel product;
  final Function() onTapRemove;

  @override
  State<ListTileProductInCart> createState() => _ListTileProductInCartState();
}

class _ListTileProductInCartState extends State<ListTileProductInCart> {
  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    return InkWell(
      onTap: _onTapImage,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 7),
        child: ListTile(
          title: Text(
            Localizations.localeOf(context).languageCode == "th"
                ? widget.product.productNameTh
                : widget.product.productNameEn,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text("฿ ${widget.product.price}"),
          leading: Image.network(
            widget.product.image,
            width: w * 0.2,
            height: h * 0.075,
            fit: BoxFit.fill,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red.shade900,
            ),
            onPressed: _removeProductInCart,
          ),
        ),
      ),
    );
  }

  void _removeProductInCart() {
    AweSomeDialogCustom.alertDialog(
        context,
        LocaleKeys.title_dialog_remove_product_in_cart.tr(),
        LocaleKeys.detail_dialog_remove_product_in_cart.tr(),
        DialogType.question,
        _confirmRemove,
        () {});
  }

  void _confirmRemove() {
    setState(() {
      int proId = widget.product.productId;
      context
          .read<AppData>()
          .products
          .removeWhere((item) => item.productId == proId);
    });
    widget.onTapRemove();
  }

  void _onTapImage() {
    AweSomeDialogCustom.alertDialogJustHaveBody(
        context,
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.network(
            widget.product.image,
            //width: w * 0.2,
            fit: BoxFit.fill,
          ),
        ),
        true);
  }
}
