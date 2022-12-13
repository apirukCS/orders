import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/awesome_dialog.dart';
import 'package:orders/widgets/full_button.dart';

class SignOut extends StatelessWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapSignOut(context);
      },
      child: FullButton(
        text: LocaleKeys.sign_out.tr(),
        textColor: Colors.white,
        radius: 4,
        background: Theme.of(context).primaryColor,
      ),
    );
  }

  void onTapSignOut(BuildContext context) {
    AweSomeDialogCustom.alertDialog(
      context,
      LocaleKeys.exit_the_application.tr(),
      LocaleKeys.sub_exit_the_application.tr(),
      DialogType.question,
      () {
        SystemNavigator.pop();
      },
      () {},
    );
  }
}
