import 'package:flutter/material.dart';

class IconBack extends StatelessWidget {
  const IconBack({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: color ?? Colors.white,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
