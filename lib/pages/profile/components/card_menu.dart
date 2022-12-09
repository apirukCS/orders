import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/pages/list_product/components/alert_setting_language.dart';
import 'package:orders/pages/profile/components/menu_profile.dart';
import 'package:orders/sizes/sizes.dart';
import 'package:orders/translations/locale_keys.g.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    int paddingTop = 130;

    return PhysicalModel(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      child: SizedBox(
        height: h - paddingTop,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              MenuProfile(
                topicMenu: LocaleKeys.name_menu_setting_language.tr(),
                onTap: () {
                  _onTapLanguage(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapLanguage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertSettingLanguage();
      },
    );
  }
}
