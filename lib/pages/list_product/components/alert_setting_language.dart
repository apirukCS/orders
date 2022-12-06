import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/full_button_outline.dart';

class AlertSettingLanguage extends StatefulWidget {
  const AlertSettingLanguage({Key? key}) : super(key: key);

  @override
  State<AlertSettingLanguage> createState() => _AlertSettingLanguageState();
}

class _AlertSettingLanguageState extends State<AlertSettingLanguage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          LocaleKeys.setting_language.tr(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: FullButtonOutline(
                  title: LocaleKeys.en.tr(),
                  height: 40,
                  onPressed: () async {
                    changeLanguage('en');
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FullButtonOutline(
                  title: LocaleKeys.th.tr(),
                  height: 40,
                  onPressed: () {
                    changeLanguage('th');
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  void changeLanguage(String languageCode) {
    Navigator.pop(context);
    context.setLocale(Locale(languageCode));
  }
}
