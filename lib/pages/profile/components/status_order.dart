import 'package:flutter/material.dart';
import 'package:orders/sizes/sizes.dart';

class StatusOrder extends StatefulWidget {
  const StatusOrder({Key? key}) : super(key: key);

  @override
  State<StatusOrder> createState() => _StatusOrderState();
}

class _StatusOrderState extends State<StatusOrder> {
  @override
  Widget build(BuildContext context) {
    double h = displayHeight(context) -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    return PhysicalModel(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            item('ที่ต้องจัดส่ง', Icons.unarchive),
            item('ที่ต้องได้รับ', Icons.fire_truck),
            item('ให้คะแนน', Icons.stars_rounded),
          ],
        ),
      ),
    );
  }

  Widget item(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey.shade800),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
