// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_coding_challenge/config/navigation_config.dart' as _i4;
import 'package:flutter_coding_challenge/DI/app_module.dart' as _i7;
import 'package:flutter_coding_challenge/network/api_repository.dart' as _i6;
import 'package:flutter_coding_challenge/network/base_service.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.dio);
    gh.factory<_i4.NavigationService>(() => _i4.NavigationService());
    gh.factory<_i5.BaseService>(() => _i5.BaseService(dio: gh<_i3.Dio>()));
    gh.factory<_i6.ApiRepository>(
        () => _i6.ApiRepository(baseService: gh<_i5.BaseService>()));
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}
