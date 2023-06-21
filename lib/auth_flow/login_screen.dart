import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sign_in_test/home_flow/home_screen.dart';
import 'package:sign_in_test/utils/helpers.dart';

import 'bloc/auth_bloc.dart';
import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';
import 'domain/models/auth_body.dart';
import 'widgets/error_text_widget.dart';
import 'widgets/login_button.dart';
import 'widgets/reset_login_button.dart';

class LoginSample extends StatefulWidget {
  const LoginSample({super.key});

  @override
  State<LoginSample> createState() => _LoginSampleState();
}

class _LoginSampleState extends State<LoginSample> {
  bool hasError = false;
  AuthBody? authBody;

  FormGroup buildForm() => fb.group(
        <String, Object>{
          LoginDataType.email.name: FormControl<String>(
            validators: [Validators.required, Validators.email],
          ),
          LoginDataType.password.name: [
            '',
            Validators.required,
            Validators.minLength(8)
          ],
          LoginDataType.rememberMe.name: false,
        },
      );

  void _onSubmit(FormGroup form) {
    if (form.valid) {
      authBody = AuthBody(
        email: form.control(LoginDataType.email.name).value,
        password: form.control(LoginDataType.password.name).value,
        rememberUser: form.control(LoginDataType.rememberMe.name).value,
      );
      BlocProvider.of<AuthBloc>(context).add(LoginEvent(authBody!));
    } else {
      form.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Test'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            setState(() {
              hasError = true;
            });
          }

          if (state is AuthSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              HomeScreen.getRoute(authBody!),
              (route) => false,
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) {
              return Column(
                children: [
                  _emailTextField(),
                  const SizedBox(height: 16.0),
                  _passwordTextField(),
                  Row(
                    children: [
                      ReactiveCheckbox(
                        formControlName: LoginDataType.rememberMe.name,
                      ),
                      const Text('Remember me')
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  LoginButton(form: form, onTap: () => _onSubmit(form)),
                  ResetLoginButton(form: form),
                  const SizedBox(height: 16.0),
                  if (hasError) const ErrorTextWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return ReactiveTextField<String>(
      formControlName: LoginDataType.email.name,
      validationMessages: emailValidationMessages,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
    );
  }

  Widget _passwordTextField() {
    return ReactiveTextField<String>(
      formControlName: LoginDataType.password.name,
      obscureText: true,
      validationMessages: passwordValidationMessages,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }
}
