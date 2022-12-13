import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          SpinKitWave(
            color: Theme.of(context).primaryColor,
            size: 40.0,
          ),
          const SizedBox(height: 16),
          const Text(
            "กำลังโหลด...",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
