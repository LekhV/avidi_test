// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sign_in_test/auth_flow/api/auth_api.dart' as _i5;
import 'package:sign_in_test/auth_flow/domain/auth_repository.dart' as _i6;
import 'package:sign_in_test/config.dart' as _i3;
import 'package:sign_in_test/infrastructure/api_client.dart' as _i7;
import 'package:sign_in_test/infrastructure/modules/auth_module.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    final authModule = _$AuthModule();
    gh.singleton<_i3.AppConfig>(_i3.AppConfig());
    gh.lazySingleton<_i4.Dio>(() => apiModule.getDio(gh<_i3.AppConfig>()));
    gh.lazySingleton<_i5.AuthApi>(() => authModule.login(gh<_i4.Dio>()));
    gh.lazySingleton<_i6.AuthRepository>(
        () => authModule.getAuthRepository(gh<_i5.AuthApi>()));
    return this;
  }
}

class _$ApiModule extends _i7.ApiModule {}

class _$AuthModule extends _i8.AuthModule {}
