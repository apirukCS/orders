import 'package:flutter/material.dart';

class FullButtonOutline extends StatelessWidget {
  const FullButtonOutline({
    Key? key,
    required this.title,
    this.titleSize,
    this.color ,
    this.icon,
    this.radius = 0,
    required this.onPressed, this.height, this.backgroundColor,
  }) : super(key: key);

  final String title;
  final double? titleSize;
  final Color? color;
  final Color? backgroundColor;
  final Widget? icon;
  final double radius;
  final VoidCallback onPressed;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Color _color = color ?? Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: double.infinity,
      height: height ?? 30,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor??Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: _color),
          ),
        ),
        onPressed: onPressed,
        label: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: titleSize ?? 16,
                color: _color,
              ),
            ),
          ],
        ),
        icon: Container(
          child: icon,
        ),
      ),
    );
  }
}
