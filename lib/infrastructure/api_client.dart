import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:sign_in_test/config.dart';

import 'dio_interceptor.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio getDio(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      contentType: Headers.jsonContentType,
    );

    final dio = Dio(options);

    return dio..interceptors.add(DioInterceptor(dio));
  }
}
