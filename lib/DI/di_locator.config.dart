// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_coding_challenge/config/navigation_config.dart' as _i5;
import 'package:flutter_coding_challenge/DI/app_module.dart' as _i7;
import 'package:flutter_coding_challenge/network/api_repository.dart' as _i3;
import 'package:flutter_coding_challenge/network/base_service.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.ApiRepositoryImp>(() => _i3.ApiRepositoryImp());
    await gh.factoryAsync<_i4.Dio>(
      () => appModule.dioClient,
      preResolve: true,
    );
    gh.factory<_i5.NavigationService>(() => _i5.NavigationService());
    gh.factory<_i6.BaseServiceImp>(() => _i6.BaseServiceImp(gh<_i4.Dio>()));
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}
