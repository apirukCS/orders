import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/pages/profile/components/menu_profile.dart';
import 'package:orders/pages/setting_languages/setting_languages_screen.dart';
import 'package:orders/sizes/sizes.dart';
import 'package:orders/translations/locale_keys.g.dart';

class CardMenuSettings extends StatelessWidget {
  const CardMenuSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    int paddingTop = 100;

    return PhysicalModel(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      child: SizedBox(
        height: h - paddingTop,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox(height: 12),
              Text(LocaleKeys.settings.tr()),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  children: [
                    MenuProfile(
                      topicMenu: Localizations.localeOf(context).languageCode == 'en'
                          ? LocaleKeys.name_menu_setting_language.tr()
                          : LocaleKeys.name_menu_setting_language.tr(),
                      icon: Icons.settings,
                      onTap: () {
                        _onTapLanguage(context);
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapLanguage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SettingLanguagesScreen()));
  }
}
