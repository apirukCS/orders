import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  const ButtonOutline({
    Key? key,
    required this.title,
    this.titleSize,
    this.color ,
    this.icon,
    this.radius = 2,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final double? titleSize;
  final Color? color;
  final Widget? icon;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color _color = color ?? Theme.of(context).colorScheme.primary;
    return SizedBox(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
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
