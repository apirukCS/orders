import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/translations/locale_keys.g.dart';

class ForGotPassword extends StatelessWidget {
  const ForGotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        Localizations.localeOf(context).languageCode == "th"
            ? LocaleKeys.ask_forget_password.tr()
            : LocaleKeys.ask_forget_password.tr(),
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
