import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/enums/sort_by_price.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/full_button_outline.dart';
import 'package:provider/provider.dart';

class SelectedSortByPrice extends StatefulWidget {
  const SelectedSortByPrice({
    Key? key,
    required this.isSelectedDescending,
  }) : super(key: key);

  final Function(String) isSelectedDescending;

  @override
  State<SelectedSortByPrice> createState() => _SelectedSortByPriceState();
}

class _SelectedSortByPriceState extends State<SelectedSortByPrice> {
  @override
  Widget build(BuildContext context) {
    String isDescending = context.read<AppData>().isDescending;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              LocaleKeys.sort_price.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                "(${isDescending == SortByPrice.NotSpecified.enumToString() ? LocaleKeys.not_specified.tr() : isDescending == SortByPrice.Descending.enumToString() ? LocaleKeys.descending.tr() : LocaleKeys.not_descending.tr()})",
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          child: FullButtonOutline(
            title: LocaleKeys.not_descending.tr(),
            titleSize: 14,
            color: isDescending == SortByPrice.NotDescending.enumToString() &&
                    isDescending != SortByPrice.NotSpecified.enumToString()
                ? Colors.grey.shade900
                : Colors.grey.shade500,
            onPressed: () {
              setState(() {
                if (isDescending == SortByPrice.NotSpecified.enumToString()) {
                  context.read<AppData>().isDescending =
                      SortByPrice.NotDescending.enumToString();
                } else if (isDescending ==
                    SortByPrice.Descending.enumToString()) {
                  context.read<AppData>().isDescending =
                      SortByPrice.NotDescending.enumToString();
                } else {
                  context.read<AppData>().isDescending =
                      SortByPrice.NotSpecified.enumToString();
                }
              });
              widget.isSelectedDescending(isDescending);
            },
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          //width: 100,
          child: FullButtonOutline(
            title: LocaleKeys.descending.tr(),
            titleSize: 14,
            color: isDescending == SortByPrice.Descending.enumToString() &&
                    isDescending != SortByPrice.NotSpecified.enumToString()
                ? Colors.grey.shade900
                : Colors.grey.shade500,
            onPressed: () {
              setState(() {
                if (isDescending == SortByPrice.NotSpecified.enumToString()) {
                  context.read<AppData>().isDescending =
                      SortByPrice.Descending.enumToString();
                } else if (isDescending ==
                    SortByPrice.NotDescending.enumToString()) {
                  context.read<AppData>().isDescending =
                      SortByPrice.Descending.enumToString();
                } else {
                  context.read<AppData>().isDescending =
                      SortByPrice.NotSpecified.enumToString();
                }
              });
              widget.isSelectedDescending(isDescending);
            },
          ),
        ),
      ],
    );
  }
}
