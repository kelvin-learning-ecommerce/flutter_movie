// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:magnus_flutter_kelvin_prayitno/config/DI/app_module.dart'
    as _i20;
import 'package:magnus_flutter_kelvin_prayitno/config/floor/floor_database.dart'
    as _i3;
import 'package:magnus_flutter_kelvin_prayitno/config/router/navigation_config.dart'
    as _i8;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/api_repository_impl.dart'
    as _i17;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/base/api_service.dart'
    as _i11;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/floor_repository_impl.dart'
    as _i6;
import 'package:magnus_flutter_kelvin_prayitno/data/repositories/storage_repository_impl.dart'
    as _i10;
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/api_repository.dart'
    as _i16;
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/floor_repository.dart'
    as _i5;
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart'
    as _i9;
import 'package:magnus_flutter_kelvin_prayitno/modules/login/bloc/login_bloc.dart'
    as _i12;
import 'package:magnus_flutter_kelvin_prayitno/modules/news/bloc/news_bloc.dart'
    as _i18;
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/bloc/news_detail_bloc.dart'
    as _i19;
import 'package:magnus_flutter_kelvin_prayitno/modules/profile/bloc/profile_bloc.dart'
    as _i13;
import 'package:magnus_flutter_kelvin_prayitno/modules/register/bloc/register_bloc.dart'
    as _i14;
import 'package:magnus_flutter_kelvin_prayitno/modules/splashscreen/bloc/splash_screen_bloc.dart'
    as _i15;

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
    await gh.factoryAsync<_i3.AppDatabase>(
      () => appModule.floorDB,
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => appModule.dio);
    gh.factory<_i5.FloorRepository>(
        () => _i6.FloorRepositoryImpl(sqlDB: gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i7.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.factory<_i8.NavigationService>(() => _i8.NavigationService());
    gh.factory<_i9.StorageRepository>(() => _i10.StorageRepositoryImpl(
        secureStorage: gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i11.ApiService>(() => _i11.ApiServiceImpl(dio: gh<_i4.Dio>()));
    gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc(
          gh<_i5.FloorRepository>(),
          gh<_i9.StorageRepository>(),
        ));
    gh.factory<_i13.ProfileBloc>(() => _i13.ProfileBloc(
          gh<_i5.FloorRepository>(),
          gh<_i9.StorageRepository>(),
        ));
    gh.factory<_i14.RegisterBloc>(() => _i14.RegisterBloc(
          gh<_i5.FloorRepository>(),
          gh<_i9.StorageRepository>(),
        ));
    gh.factory<_i15.SplashScreenBloc>(() => _i15.SplashScreenBloc(
          gh<_i9.StorageRepository>(),
          gh<_i5.FloorRepository>(),
        ));
    gh.factory<_i16.ApiRepository>(
        () => _i17.ApiRepositoryImpl(baseService: gh<_i11.ApiService>()));
    gh.factory<_i18.NewsBloc>(() => _i18.NewsBloc(gh<_i16.ApiRepository>()));
    gh.factory<_i19.NewsDetailBloc>(
        () => _i19.NewsDetailBloc(gh<_i16.ApiRepository>()));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}