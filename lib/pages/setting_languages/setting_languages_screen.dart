import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/pages/setting_languages/components/list_tile_language.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/icon_back.dart';

class SettingLanguagesScreen extends StatefulWidget {
  const SettingLanguagesScreen({Key? key}) : super(key: key);

  @override
  State<SettingLanguagesScreen> createState() => _SettingLanguagesScreenState();
}

class _SettingLanguagesScreenState extends State<SettingLanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    bool isEnLocal = Localizations.localeOf(context).languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        leading: const IconBack(),
        title: Text(LocaleKeys.setting_language.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTileLanguage(
              title: LocaleKeys.en.tr(),
              languageCode: 'en',
              isShowIconDone: isEnLocal,
              onTapListTile: _onTapListTile,
            ),
            const Divider(thickness: 1),
            ListTileLanguage(
              title: LocaleKeys.th.tr(),
              languageCode: 'th',
              isShowIconDone: !isEnLocal,
              onTapListTile: _onTapListTile,
            ),
            const Divider(thickness: 1),
          ],
        ),
      ),
    );
  }

  void _onTapListTile() {
    setState(() {});
  }
}
