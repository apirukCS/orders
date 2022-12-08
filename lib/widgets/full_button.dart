import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  const FullButton({
    Key? key,
    this.icon,
    required this.text,
    required this.textColor,
    required this.background,
    this.radius,
  }) : super(key: key);

  final Widget? icon;
  final String text;
  final Color textColor;
  final Color background;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        //color: Colors.red[900],
        borderRadius: BorderRadius.circular(radius ?? 30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
