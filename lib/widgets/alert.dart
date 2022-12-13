import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Alert {
  static alertDialog(context, String title, String desc,
      DialogType type,[VoidCallback? btnOkOnPress,VoidCallback? btnCancelOnPress]) {
    return AwesomeDialog(
        context: context,
        animType: AnimType.topSlide,
        dialogType: type,
        title: title,
        titleTextStyle:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        desc: desc,
        btnOkOnPress: btnOkOnPress,
        btnCancelOnPress: btnCancelOnPress,
        btnOkIcon: Icons.check_circle,
        btnCancelIcon: Icons.cancel_outlined,
        onDismissCallback: (type) {
          //Navigator.pop(context);
        })
      ..show();
  }

  static alertDialogJustHaveBody(
      context, Widget widget,[bool? isShowIconCancel]) {
    return AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.NO_HEADER,
        body: widget,
        showCloseIcon: isShowIconCancel ?? false,
        onDismissCallback: (type) {
          //Navigator.pop(context);
        })
      ..show();
  }
}
