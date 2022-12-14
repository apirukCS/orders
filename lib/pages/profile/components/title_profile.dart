import 'package:flutter/material.dart';
import 'package:orders/pages/edit_profile/edit_profile.dart';

class TitleProfile extends StatelessWidget {
  const TitleProfile({
    Key? key,
    required this.image,
    required this.name,
    required this.phone
  }) : super(key: key);

  final String image;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _onTapEdit(context);
      },
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.edit,
              color: Colors.black87,),
          ),
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Theme.of(context).primaryColor,
            child: CircleAvatar(
              radius: 48.0,
              backgroundImage: NetworkImage(image),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapEdit(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EditProfile()));
  }
}
