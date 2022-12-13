import 'package:flutter/material.dart';
import 'package:orders/api/api_user.dart';
import 'package:orders/model/user_model.dart';
import 'package:orders/pages/homepage/home_page_screen.dart';
import 'package:orders/pages/profile/components/card_menu_settings.dart';
import 'package:orders/pages/profile/components/sign_out.dart';
import 'package:orders/pages/profile/components/title_profile.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
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
                      return TitleProfile(
                        image: user.data!.image,
                        name:
                            Localizations.localeOf(context).languageCode == "th"
                                ? user.data!.fullNameTh
                                : user.data!.fullNameEn,
                        phone: user.data!.phone,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                /*const SizedBox(height: 16),
                const StatusOrder(),*/
                const SizedBox(height: 16),
                const CardMenuSettings(),
                const SignOut(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const HomePageScreen()));
    return true;
  }
}
