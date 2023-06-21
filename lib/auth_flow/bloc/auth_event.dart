import 'package:equatable/equatable.dart';
import 'package:sign_in_test/auth_flow/domain/models/auth_body.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final AuthBody authBody;

  LoginEvent(this.authBody);

  @override
  List<Object> get props => [authBody];
}
