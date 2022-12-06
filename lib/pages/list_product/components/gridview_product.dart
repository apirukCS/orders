import 'package:flutter/material.dart';
import 'package:orders/enums/sort_by_price.dart';
import 'package:orders/model/product_model.dart';
import 'package:orders/pages/detail_product/detail_product_screen.dart';
import 'package:orders/sizes/sizes.dart';

class GridViewProduct extends StatefulWidget {
  const GridViewProduct(
      {Key? key,
      required this.products,
      required this.isDescending,
      required this.minimumPrice,
      required this.maximumPrice})
      : super(key: key);

  final List<ProductModel> products;

  final String isDescending;
  final int minimumPrice;
  final int maximumPrice;

  @override
  State<GridViewProduct> createState() => _GridViewProductState();
}

class _GridViewProductState extends State<GridViewProduct> {
  @override
  Widget build(BuildContext context) {
    double w = displayWidth(context);
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    List<ProductModel> products = widget.products;

    //ถ้ามีการใส่ช่วงราคา
    if (widget.maximumPrice != -1) {
      setState(() {
        products = products
            .where((e) =>
                e.price >= widget.minimumPrice &&
                e.price <= widget.maximumPrice)
            .toList();
      });
    } else {
      setState(() {
        products =
            products.where((e) => e.price >= widget.minimumPrice).toList();
      });
    }

    //ถ้าเลือกว่าเรียงจากมากไปน้อยหรือน้อยไปมาก
    if (widget.isDescending == SortByPrice.Descending.enumToString()) {
      products.sort((a, b) => b.price.compareTo(a.price));
    } else if (widget.isDescending ==
        SortByPrice.NotDescending.enumToString()) {
      products.sort((a, b) => a.price.compareTo(b.price));
    }

    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: (h + w) * 0.2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            _onTapProduct(products[index], context);
          },
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: h * 0.2,
                  child: Image.network(
                    products[index].image,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              Localizations.localeOf(context).languageCode ==
                                      "th"
                                  ? products[index].productNameTh
                                  : products[index].productNameEn,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "฿ ${products[index].price}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onTapProduct(ProductModel product, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailProductScreen(product: product),
      ),
    );
  }
}
