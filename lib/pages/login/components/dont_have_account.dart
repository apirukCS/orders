import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/translations/locale_keys.g.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.dont_have_an_account.tr(),
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          LocaleKeys.register.tr(),
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
