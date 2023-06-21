import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sign_in_test/utils/helpers.dart';

class ResetLoginButton extends StatelessWidget {
  final FormGroup form;
  const ResetLoginButton({super.key, required this.form});

  void _onTap() {
    form.resetState(
      {
        LoginDataType.email.name: ControlState<String>(value: null),
        LoginDataType.password.name: ControlState<String>(value: null),
        LoginDataType.rememberMe.name: ControlState<bool>(value: false),
      },
      removeFocus: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onTap,
      child: const Text('Reset all'),
    );
  }
}
