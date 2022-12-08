import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/pages/list_product/components/alert_setting_language.dart';
import 'package:orders/translations/locale_keys.g.dart';

class SettingLanguage extends StatelessWidget {
  const SettingLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 18,
      right: 18,
      child: InkWell(
        onTap: () {
          _onTapSetting(context);
        },
        child: Row(
          children: [
            const Icon(Icons.settings, size: 18),
            const SizedBox(width: 2),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                LocaleKeys.name_menu_setting_language.tr(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapSetting(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertSettingLanguage();
      },
    );
  }
}
