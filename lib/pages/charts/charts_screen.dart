import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/api/api_product.dart';
import 'package:orders/model/product_model.dart';
import 'package:orders/pages/homepage/home_page_screen.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({Key? key}) : super(key: key);

  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  final Future<List<ProductModel>> _products = ApiProduct.fetchListAllProduct();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.chart.tr()),
        leadingWidth: 0,
        leading: const SizedBox(),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  LocaleKeys.chart_bar_graph_product.tr(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 500,
                child: Center(
                  child: FutureBuilder(
                    future: _products,
                    builder: (context,
                        AsyncSnapshot<List<ProductModel>> productFuture) {
                      List<ProductModel> products = productFuture.data ?? [];
                      if (products.isNotEmpty) {
                        return SfCartesianChart(
                          enableAxisAnimation: true,
                          primaryXAxis: CategoryAxis(
                            labelRotation: 90,
                          ),
                          /*primaryYAxis: NumericAxis(
                              title: AxisTitle(
                                  text: 'ราคาสินค้า',
                              )
                          ),*/
                          series: <ChartSeries>[
                            ColumnSeries<ProductModel, String>(
                              animationDuration: 2000,
                              dataSource: products,
                              xValueMapper: (ProductModel data, _) => Localizations
                                              .localeOf(context)
                                          .languageCode ==
                                      "th"
                                  ? data.productNameTh.length <= 20
                                      ? data.productNameTh
                                      : "${data.productNameTh.toString().substring(0, 20)}..."
                                  : data.productNameEn.length <= 20
                                      ? data.productNameEn
                                      : "${data.productNameEn.toString().substring(0, 20)}...",
                              yValueMapper: (ProductModel data, _) =>
                                  data.price,
                              spacing: 0.2,
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const HomePageScreen()));
    return true;
  }
}
