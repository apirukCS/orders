import 'package:flutter/material.dart';

class NameAndLogoApp extends StatelessWidget {
  const NameAndLogoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Image.asset("images/logo-white.png",color: Theme.of(context).primaryColor,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rise+",
                  style: TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "Shopping",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
