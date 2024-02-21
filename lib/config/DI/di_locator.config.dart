// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:magnus_flutter_kelvin_prayitno/config/DI/app_module.dart'
    as _i15;
import 'package:magnus_flutter_kelvin_prayitno/config/router/navigation_config.dart'
    as _i5;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/api_repository_impl.dart'
    as _i11;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/base/api_service.dart'
    as _i8;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/storage_repository_impl.dart'
    as _i7;
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/api_repository.dart'
    as _i10;
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart'
    as _i6;
import 'package:magnus_flutter_kelvin_prayitno/modules/login/bloc/login_bloc.dart'
    as _i12;
import 'package:magnus_flutter_kelvin_prayitno/modules/news/bloc/news_bloc.dart'
    as _i13;
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/bloc/news_detail_bloc.dart'
    as _i14;
import 'package:magnus_flutter_kelvin_prayitno/modules/splashscreen/bloc/splash_screen_bloc.dart'
    as _i9;

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
    gh.lazySingleton<_i4.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.factory<_i5.NavigationService>(() => _i5.NavigationService());
    gh.factory<_i6.StorageRepository>(() => _i7.StorageRepositoryImpl(
        secureStorage: gh<_i4.FlutterSecureStorage>()));
    gh.factory<_i8.ApiService>(() => _i8.ApiServiceImpl(dio: gh<_i3.Dio>()));
    gh.factory<_i9.SplashScreenBloc>(
        () => _i9.SplashScreenBloc(gh<_i6.StorageRepository>()));
    gh.factory<_i10.ApiRepository>(
        () => _i11.ApiRepositoryImpl(baseService: gh<_i8.ApiService>()));
    gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc(
          gh<_i10.ApiRepository>(),
          gh<_i6.StorageRepository>(),
        ));
    gh.factory<_i13.NewsBloc>(() => _i13.NewsBloc(gh<_i10.ApiRepository>()));
    gh.factory<_i14.NewsDetailBloc>(
        () => _i14.NewsDetailBloc(gh<_i10.ApiRepository>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
