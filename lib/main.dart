import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_flow/bloc/auth_bloc.dart';
import 'auth_flow/login_screen.dart';
import 'infrastructure/injectable.dart';
import 'utils/shared_preferences_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesWrapper.processInitialize();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => AuthBloc(),
        child: const LoginSample(),
      ),
    );
  }
}
