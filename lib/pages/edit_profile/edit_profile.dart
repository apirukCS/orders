import 'package:flutter/material.dart';
import 'package:orders/api/api_user.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:orders/utils/validate.dart';
import 'package:orders/widgets/alert.dart';
import 'package:orders/widgets/dialog_loading.dart';
import 'package:orders/widgets/full_button.dart';
import 'package:orders/widgets/icon_back.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  FocusNode fNameTh = FocusNode();
  FocusNode fNameEn = FocusNode();
  FocusNode fEmail = FocusNode();
  FocusNode fPhone = FocusNode();
  FocusNode fAge = FocusNode();
  FocusNode fAddress = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameThController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    int userId = context.read<AppData>().userId;
    ApiUser.getUserById(userId).then((value) {
      nameThController.text = value.fullNameTh;
      nameEnController.text = value.fullNameEn;
      emailController.text = value.email;
      phoneController.text = value.phone;
      ageController.text = value.age.toString();
      addressController.text = value.address;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    double paddingBetweenFiled = 14;
    return Scaffold(
      appBar: AppBar(
        leading: const IconBack(),
        title: const Text('EditProfile'),
      ),
      body: GestureDetector(
        onTap: _onTapBody,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: nameThController,
                  focusNode: fNameTh,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Thai name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  validator: validateString,
                ),
                SizedBox(height: paddingBetweenFiled),
                TextFormField(
                    controller: nameEnController,
                    focusNode: fNameEn,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      labelText: "English name",
                    ),
                    validator: validateString),
                SizedBox(height: paddingBetweenFiled),
                TextFormField(
                  controller: emailController,
                  focusNode: fEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Email",
                  ),
                  validator: validateString,
                ),
                SizedBox(height: paddingBetweenFiled),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                          controller: phoneController,
                          focusNode: fPhone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone_in_talk_outlined),
                            labelText: "Phone",
                          ),
                          validator: validateString),
                    ),
                    SizedBox(width: paddingBetweenFiled),
                    Expanded(
                      child: TextFormField(
                        controller: ageController,
                        focusNode: fAge,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.av_timer),
                          labelText: "Age",
                        ),
                        validator: validateString,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: paddingBetweenFiled * 2),
                TextFormField(
                  controller: addressController,
                  focusNode: fAddress,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "Address",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  validator: validateString,
                ),
                SizedBox(height: keyBoardHeight / 2),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: _onTapEdit,
          child: SizedBox(
            height: 40,
            child: FullButton(
              text: "edit",
              textColor: Colors.white,
              background: Theme.of(context).primaryColor,
              radius: 8,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapEdit() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "nameTh": nameThController.text,
        "nameEn": nameEnController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "age": ageController.text,
        "address": addressController.text,
      };

      Alert.alertDialogJustHaveBody(
        context,
        const DialogLoading(),
      );

      ApiUser.editUser(data).then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    }
  }

  void _onTapBody() {
    fNameTh.unfocus();
    fNameEn.unfocus();
    fEmail.unfocus();
    fPhone.unfocus();
    fAge.unfocus();
    fAddress.unfocus();
  }
}
