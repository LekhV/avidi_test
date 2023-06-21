import 'package:json_annotation/json_annotation.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class AuthResponseDTO {
  final String domain;

  AuthResponseDTO(this.domain);

  // TODO: its normal model, but now I use test api
  // final String refreshToken;
  // final String accessToken;

  // AuthResponseDTO(this.refreshToken, this.accessToken);

  factory AuthResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDTOFromJson(json);
}
