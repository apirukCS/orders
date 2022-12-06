import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/enums/sort_by_price.dart';
import 'package:orders/pages/list_product/components/selected_sort_by_price.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/full_button_outline.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class AlertFilterProduct extends StatefulWidget {
  const AlertFilterProduct({Key? key, required this.isSelectedDescending})
      : super(key: key);

  final Function(String, int, int) isSelectedDescending;

  @override
  State<AlertFilterProduct> createState() => _AlertFilterProductState();
}

class _AlertFilterProductState extends State<AlertFilterProduct> {
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  int? minimumPrice;
  int? maximumPrice;
  String isDescending = "";
  bool isMaxMoreMin = true;
  bool minimumMoreZero = true;

  @override
  void initState() {
    setState(() {
      if (context.read<AppData>().minimumPrice != -1) {
        minController.text = context.read<AppData>().minimumPrice.toString();
      }

      if (context.read<AppData>().maximumPrice != -1) {
        maxController.text = context.read<AppData>().maximumPrice.toString();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    minimumPrice = context.read<AppData>().minimumPrice;
    maximumPrice = context.read<AppData>().maximumPrice;

    return AlertDialog(
      title: Center(
        child: Text(
          LocaleKeys.filter_product.tr(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.price_range.tr(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: minController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp("[0-9]"),
                                allow: true),
                          ],
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: LocaleKeys.minimum_price.tr(),
                            hintStyle: const TextStyle(fontSize: 14),
                            isDense: true,
                            alignLabelWithHint: true,
                            contentPadding:
                                const EdgeInsets.all(8), // Added this
                          ),
                        ),
                      ),
                      const Text(" - "),
                      Expanded(
                        child: TextFormField(
                          controller: maxController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp("[0-9]"),
                                allow: true),
                          ],
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: LocaleKeys.maximum_price.tr(),
                            hintStyle: const TextStyle(fontSize: 14),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                        ),
                      )
                    ],
                  ),
                  minimumMoreZero == false
                      ? Text(
                          "***${LocaleKeys.text_alert_minimum_price.tr()}",
                          style: TextStyle(
                              color: Colors.red.shade900, fontSize: 12),
                        )
                      : isMaxMoreMin == false
                          ? Text(
                              "***${LocaleKeys.text_alert_price_range.tr()}",
                              style: TextStyle(
                                  color: Colors.red.shade900, fontSize: 12),
                            )
                          : const SizedBox(),
                ],
              ),
              const SizedBox(height: 24),
              SelectedSortByPrice(
                isSelectedDescending: (callBack) {
                  setState(() {
                    isDescending = callBack;
                  });
                },
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: _onTapClearFilter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.remove_circle_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      LocaleKeys.filter_clear.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: FullButtonOutline(
                  title: LocaleKeys.cancel.tr(),
                  backgroundColor: Theme.of(context).primaryColor,
                  height: 40,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FullButtonOutline(
                  title: LocaleKeys.confirm.tr(),
                  backgroundColor: Theme.of(context).primaryColor,
                  height: 40,
                  color: Colors.white,
                  onPressed: _OnConfirm,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  void _OnConfirm() {
    setState(() {
      isMaxMoreMin = true;
      minimumMoreZero == true;
      if (minController.text.isNotEmpty) {
        minimumPrice = int.parse(minController.text.toString());
        if (minimumPrice! <= 0) {
          minimumMoreZero = false;
          isMaxMoreMin = false;
        }
        _checkMaxPrice();
      }

      if (isMaxMoreMin == true) {
        context.read<AppData>().minimumPrice = minimumPrice ?? -1;
        context.read<AppData>().maximumPrice = maximumPrice ?? -1;
        widget.isSelectedDescending(
            isDescending, minimumPrice ?? -1, maximumPrice ?? -1);
        Navigator.pop(context);
      }
    });
  }

  void _onTapClearFilter() {
    minController.text = "";
    maxController.text = "";
    context.read<AppData>().minimumPrice = -1;
    context.read<AppData>().maximumPrice = -1;
    context.read<AppData>().isDescending =
        SortByPrice.NotSpecified.enumToString();

    widget.isSelectedDescending(
        context.read<AppData>().isDescending,
        context.read<AppData>().minimumPrice,
        context.read<AppData>().maximumPrice);
    setState(() {});
  }

  void _checkMaxPrice() {
    setState(() {
      if (maxController.text.isNotEmpty) {
        maximumPrice = int.parse(maxController.text.toString());
        if (maximumPrice! >= minimumPrice!) {
          isMaxMoreMin = true;
        } else {
          isMaxMoreMin = false;
        }
      } else {
        context.read<AppData>().maximumPrice = -1;
      }
    });
  }
}
