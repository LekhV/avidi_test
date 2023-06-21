import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:sign_in_test/auth_flow/api/auth_api.dart';
import 'package:sign_in_test/auth_flow/data/auth_repository_impl.dart';
import 'package:sign_in_test/auth_flow/domain/auth_repository.dart';

@module
abstract class AuthModule {
  @lazySingleton
  AuthApi login(Dio dio) => AuthApi(dio);

  @lazySingleton
  AuthRepository getAuthRepository(AuthApi api) {
    return AuthRepositoryImpl(api);
  }
}
