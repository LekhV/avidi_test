import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sign_in_test/auth_flow/domain/auth_repository.dart';
import 'package:sign_in_test/utils/shared_preferences_helper.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;
  DioInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = SharedPreferencesWrapper.getToken();
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    final refreshToken = SharedPreferencesWrapper.getToken();

    if (error.response?.statusCode == 401) {
      try {
        dio.options.headers['Authorization'] = 'Bearer $refreshToken';

        String newAccessToken = await GetIt.instance
            .get<AuthRepository>()
            .refreshToken(refreshToken);

        error.requestOptions.headers['Authorization'] =
            'Bearer $newAccessToken';

        handler.resolve(await dio.fetch(error.requestOptions));
      } catch (_) {
        handler.reject(error);
      }
    } else {
      print(error);
      handler.next(error);
    }
  }
}
