import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginButton extends StatelessWidget {
  final FormGroup form;
  final VoidCallback onTap;
  const LoginButton({super.key, required this.form, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text('Sign Up'),
    );
  }
}
