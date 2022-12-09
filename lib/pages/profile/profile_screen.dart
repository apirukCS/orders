import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/api/api_user.dart';
import 'package:orders/model/user_model.dart';
import 'package:orders/pages/profile/components/card_menu.dart';
import 'package:orders/pages/profile/components/sign_out.dart';
import 'package:orders/pages/profile/components/title_profile.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          leadingWidth: 0,
          title: Text(
            Localizations.localeOf(context).languageCode == "th"
                ? "${LocaleKeys.profile.tr()} "
                : "${LocaleKeys.profile.tr()} ",
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          elevation: 0.2,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 8),
              FutureBuilder(
                future: ApiUser.getUserById(context.read<AppData>().userId),
                builder: (context, AsyncSnapshot<UserModel> user) {
                  if (user.hasData) {
                    //ToDo check Local
                    return TitleProfile(
                      image: user.data!.image,
                      name: Localizations.localeOf(context).languageCode == "th"
                          ? user.data!.fullNameTh
                          : user.data!.fullNameEn,
                      phone: user.data!.phone,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 16),
              const CardMenu(),
              const SignOut(),
            ],
          ),
        ),
      ),
    );
  }
}
