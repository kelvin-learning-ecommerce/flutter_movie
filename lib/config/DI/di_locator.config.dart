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
    as _i6;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/api_repository_impl.dart'
    as _i13;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/base/api_service.dart'
    as _i10;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/storage_repository_impl.dart'
    as _i9;
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/api_repository.dart'
    as _i12;
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart'
    as _i8;
import 'package:magnus_flutter_kelvin_prayitno/features/movie/bloc/movie_bloc.dart'
    as _i14;
import 'package:magnus_flutter_kelvin_prayitno/features/moviedetail/bloc/movie_detail_bloc.dart'
    as _i5;
import 'package:magnus_flutter_kelvin_prayitno/features/splashscreen/bloc/splash_screen_bloc.dart'
    as _i11;
import 'package:magnus_flutter_kelvin_prayitno/utils/local_notification/notification_service.dart'
    as _i7;

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
    gh.factory<_i5.MovieDetailBloc>(() => _i5.MovieDetailBloc());
    gh.factory<_i6.NavigationService>(() => _i6.NavigationService());
    gh.factory<_i7.NotificationService>(() => _i7.NotificationService());
    gh.factory<_i8.StorageRepository>(() => _i9.StorageRepositoryImpl(
        secureStorage: gh<_i4.FlutterSecureStorage>()));
    gh.factory<_i10.ApiService>(() => _i10.ApiServiceImpl(dio: gh<_i3.Dio>()));
    gh.factory<_i11.SplashScreenBloc>(
        () => _i11.SplashScreenBloc(gh<_i8.StorageRepository>()));
    gh.factory<_i12.ApiRepository>(
        () => _i13.ApiRepositoryImpl(baseService: gh<_i10.ApiService>()));
    gh.factory<_i14.MovieBloc>(() => _i14.MovieBloc(gh<_i12.ApiRepository>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
