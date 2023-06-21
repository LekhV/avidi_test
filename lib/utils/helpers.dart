import 'package:reactive_forms/reactive_forms.dart';

enum LoginDataType { email, password, rememberMe }

Map<String, String Function(Object)>? passwordValidationMessages = {
  ValidationMessage.required: (_) => 'The password must not be empty',
  ValidationMessage.minLength: (_) =>
      'The password must be at least 8 characters',
};

Map<String, String Function(Object)>? emailValidationMessages = {
  ValidationMessage.required: (_) => 'The email must not be empty',
  ValidationMessage.email: (_) => 'The email value must be a valid email',
  'unique': (_) => 'This email is already in use',
};
