import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Something Wrong',
      style: TextStyle(color: Colors.red),
    );
  }
}
