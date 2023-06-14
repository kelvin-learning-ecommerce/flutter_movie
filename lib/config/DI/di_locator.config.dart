// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_coding_challenge/config/DI/app_module.dart' as _i10;
import 'package:flutter_coding_challenge/config/router/navigation_config.dart'
    as _i4;
import 'package:flutter_coding_challenge/data/repositories/api_repository_impl.dart'
    as _i7;
import 'package:flutter_coding_challenge/data/repositories/base/api_service.dart'
    as _i5;
import 'package:flutter_coding_challenge/domain/repositories/api_repository.dart'
    as _i6;
import 'package:flutter_coding_challenge/presentation/blocs/game_detail_bloc.dart'
    as _i8;
import 'package:flutter_coding_challenge/presentation/blocs/game_list_bloc.dart'
    as _i9;
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
    gh.factory<_i5.ApiService>(() => _i5.ApiServiceImpl(dio: gh<_i3.Dio>()));
    gh.factory<_i6.ApiRepository>(
        () => _i7.ApiRepositoryImpl(baseService: gh<_i5.ApiService>()));
    gh.factory<_i8.GameDetailBloc>(
        () => _i8.GameDetailBloc(gh<_i6.ApiRepository>()));
    gh.factory<_i9.GameListBloc>(
        () => _i9.GameListBloc(gh<_i6.ApiRepository>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
