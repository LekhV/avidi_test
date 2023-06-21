import 'package:json_annotation/json_annotation.dart';

part 'auth_body.g.dart';

@JsonSerializable(createToJson: true)
class AuthBody {
  final String email;
  final String password;
  @JsonKey(name: 'remember_user')
  final bool rememberUser;

  AuthBody({
    required this.email,
    required this.password,
    required this.rememberUser,
  });

  Map<String, dynamic> toJson() => _$AuthBodyToJson(this);
}
