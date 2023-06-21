import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sign_in_test/auth_flow/domain/models/auth_body.dart';

import 'dto/auth_response_dto.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @GET('/email/{email}')
  Future<AuthResponseDTO> login(@Path() String email);
  // TODO: its normal login, but now I use test api
  // Future<AuthResponseDTO> login(@Body() AuthBody body);

  @POST('/refreshToken')
  Future<AuthResponseDTO> refreshToken(@Body() String refreshToken);
}
