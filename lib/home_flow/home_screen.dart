import 'package:flutter/material.dart';
import 'package:sign_in_test/auth_flow/domain/models/auth_body.dart';

class HomeScreen extends StatelessWidget {
  static const _routeName = '/home';

  static MaterialPageRoute getRoute(AuthBody authBody) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (_) => HomeScreen(authBody: authBody),
    );
  }

  final AuthBody authBody;
  const HomeScreen({Key? key, required this.authBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Email : ${authBody.email}'),
            Text('Remember Me :  ${authBody.rememberUser}'),
          ],
        ),
      ),
    );
  }
}
