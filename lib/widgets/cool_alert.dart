import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class Alert {
  final String? title;
  final String? message;
  Alert({
    this.title,
    this.message,
  });
  void loading(BuildContext context) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      text: "กำลังโหลด...",
      autoCloseDuration: const Duration(seconds: 30),
      barrierDismissible: false,
    );
  }

  void success(BuildContext context,
      [VoidCallback? onConfirmBtnTap, bool barrierDismissible = true]) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: "สำเร็จ",
      backgroundColor: Colors.greenAccent,
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: onConfirmBtnTap,
      barrierDismissible: barrierDismissible,
    );
  }

  void error(BuildContext context) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: "เกิดข้อผิดพลาด !",
      backgroundColor: Colors.redAccent,
      confirmBtnColor: Colors.red,
    );
  }

  void warning(BuildContext context) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: "เกิดข้อผิดพลาด !",
      backgroundColor: Colors.amberAccent.shade700,
      confirmBtnColor: Colors.amber,
    );
  }

  void newError(BuildContext context, String title, message) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: title,
      text: message,
      loopAnimation: true,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
      confirmBtnColor: Theme.of(context).primaryColor,
    );
  }

  void newWarning(BuildContext context, String title, message) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      title: title,
      text: message,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
      confirmBtnColor: Theme.of(context).primaryColor,
    );
  }

  void info(BuildContext context, String title) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.info,
      title: title,
      backgroundColor: Colors.blue.shade200,
      confirmBtnColor: Colors.blue,
    );
  }

  static void decision(BuildContext context,
      [String? title, String? message, VoidCallback? onConfirmBtnTap]) {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.confirm,
      title: title,
      text: message,
      // barrierDismissible: false,
      cancelBtnText: 'ยกเลิก',
      onCancelBtnTap: () {
        Navigator.pop(context);
      },
      confirmBtnText: 'ตกลง',
      onConfirmBtnTap: onConfirmBtnTap,
    );
  }


  void dismiss(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (context != null) {
      Navigator.pop(context);
    }
  }
}