import 'package:flutter/material.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    Key? key,
    required this.topicMenu,
    required this.onTap,
  }) : super(key: key);

  final String topicMenu;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(
              Icons.settings,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              topicMenu,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 16,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
