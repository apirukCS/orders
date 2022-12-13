import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/api/api_user.dart';
import 'package:orders/pages/homepage/home_page_screen.dart';
import 'package:orders/pages/login/components/forgot_password.dart';
import 'package:orders/pages/login/components/name_and_logo_app.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/translations/locale_keys.g.dart';
import 'package:orders/widgets/alert.dart';
import 'package:orders/widgets/dialog_loading.dart';
import 'package:orders/widgets/full_button.dart';
import 'package:provider/provider.dart';
import 'components/dont_have_account.dart';
import 'components/setting_language.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode fEmail = FocusNode();
  FocusNode fPassword = FocusNode();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: _onTapBody,
        child: Scaffold(
          body: Stack(
            children: [
              const SettingLanguage(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                const Center(
                                  child: NameAndLogoApp(),
                                ),
                                const SizedBox(height: 54),
                                TextFormField(
                                  controller: emailController,
                                  focusNode: fEmail,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.email_outlined),
                                      hintText: LocaleKeys.email.tr(),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26))),
                                  validator: (email) {
                                    if (email == "") {
                                      return LocaleKeys.alert_validate_email
                                          .tr();
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: passwordController,
                                  focusNode: fPassword,
                                  obscureText: obscurePassword,
                                  decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.lock_clock_rounded),
                                      suffix: InkWell(
                                        onTap: _onTapObscurePassword,
                                        child: Icon(
                                          obscurePassword == false
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      hintText: LocaleKeys.password.tr(),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26))),
                                  validator: (password) {
                                    if (password == "") {
                                      return LocaleKeys.alert_validate_password
                                          .tr();
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 24),
                                const ForGotPassword(),
                                const SizedBox(height: 42),
                                InkWell(
                                  onTap: _onTapLogin,
                                  child: FullButton(
                                    text: LocaleKeys.sign_in.tr(),
                                    textColor: Colors.white,
                                    background: Theme.of(context).primaryColor,
                                    radius: 8,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const DontHaveAccount(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapLogin() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      String email = emailController.text.toString();
      String password = passwordController.text.toString();

      Alert.alertDialogJustHaveBody(
        context,
        const DialogLoading(),
        false,
      );
      Future.delayed(const Duration(seconds: 1), () {
        ApiUser.fetchAllUsers().then((value) {
          var contain = value.where((element) =>
              element.email == email && element.password == password);
          if (contain.isNotEmpty) {
            context.read<AppData>().userId = contain.first.userId;
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePageScreen()));
          } else {
            Navigator.pop(context);
            Alert.alertDialog(
              context,
              "\n${LocaleKeys.alert_wrong_email_or_password.tr()}",
              "",
              DialogType.noHeader,
              () {},
            );
          }
        });
      });
    }
  }

  void _onTapObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void _onTapBody() {
    fEmail.unfocus();
    fPassword.unfocus();
  }
}
