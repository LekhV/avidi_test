import 'package:sign_in_test/auth_flow/api/auth_api.dart';
import 'package:sign_in_test/auth_flow/domain/auth_repository.dart';
import 'package:sign_in_test/auth_flow/domain/models/auth_body.dart';
import 'package:sign_in_test/utils/shared_preferences_helper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl(this.authApi);

  @override
  Future<void> login(AuthBody body) async {
    try {
      final response = await authApi.login(body.email);
      // TODO: its normal save token, but now I use test api
      // await SharedPreferencesWrapper.setToken(response.accessToken);
      // await SharedPreferencesWrapper.setRefreshToken(response.refreshToken);
      print(response.domain);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<String> refreshToken(String refreshToken) async {
    try {
      final response = await authApi.refreshToken(refreshToken);
      // TODO: its normal save token, but now I use test api
      // await SharedPreferencesWrapper.setToken(response.accessToken);
      // await SharedPreferencesWrapper.setRefreshToken(response.refreshToken);
      // return response.accessToken;
      return 'accessToken';
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
