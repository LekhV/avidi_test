import 'models/auth_body.dart';

abstract class AuthRepository {
  Future<void> login(AuthBody body);
  Future<String> refreshToken(String refreshToken);
}
