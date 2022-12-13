import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({Key? key, required this.paddingTB}) : super(key: key);

  final double paddingTB;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: paddingTB,bottom: paddingTB),
      child: const Divider(thickness: 1),
    );
  }
}
