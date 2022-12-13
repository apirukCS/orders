import 'package:flutter/material.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    Key? key,
    required this.topicMenu,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final String topicMenu;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Icon(
              icon,
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
