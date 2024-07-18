// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:monie_point/data/data.dart' as _i19;
import 'package:monie_point/data/local/configuration/configuration_persistence.dart'
    as _i16;
import 'package:monie_point/data/repository/configuration/configuration_data_repository.dart'
    as _i17;
import 'package:monie_point/data/repository/configuration/configuration_data_source.dart'
    as _i15;
import 'package:monie_point/domain/configuration/get/get_configuration_use_case.dart'
    as _i18;
import 'package:monie_point/domain/domain.dart' as _i21;
import 'package:monie_point/infrastructure/config/network/authentication_interceptor.dart'
    as _i3;
import 'package:monie_point/infrastructure/config/network/fake_login_interceptor.dart'
    as _i6;
import 'package:monie_point/infrastructure/routing/app_router.dart' as _i14;
import 'package:monie_point/infrastructure/routing/providers/home_route_provider.dart'
    as _i7;
import 'package:monie_point/infrastructure/routing/providers/splash_route_provider.dart'
    as _i11;
import 'package:monie_point/infrastructure/routing/route_factory.dart' as _i13;
import 'package:monie_point/infrastructure/routing/transition/default_transition.dart'
    as _i4;
import 'package:monie_point/infrastructure/routing/transition/login_transition.dart'
    as _i8;
import 'package:monie_point/infrastructure/routing/transition_factory.dart'
    as _i12;
import 'package:monie_point/presentation/modules/global/global_bloc.dart'
    as _i20;
import 'package:monie_point/presentation/modules/splash/bloc/splash_bloc.dart'
    as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import 'module/local_module.dart' as _i22;
import 'module/network_module.dart' as _i23;

const String _dev = 'dev';
const String _stage = 'stage';
const String _prod = 'prod';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final localModule = _$LocalModule();
    gh.factory<_i3.AuthenticationInterceptor>(
        () => _i3.AuthenticationInterceptor());
    gh.factory<_i4.DefaultTransition>(() => _i4.DefaultTransition());
    gh.factory<_i5.Dio>(
      () => networkModule.provideDio(gh<_i3.AuthenticationInterceptor>()),
      instanceName: 'auth',
      registerFor: {
        _stage,
        _prod,
      },
    );
    gh.factory<_i5.Dio>(
      () => networkModule.provideChatDio(gh<_i3.AuthenticationInterceptor>()),
      instanceName: 'chat',
      registerFor: {
        _stage,
        _prod,
      },
    );
    gh.factory<_i6.FakeLoginInterceptor>(
      () => _i6.FakeLoginInterceptor(),
      registerFor: {_dev},
    );
    gh.factory<_i7.HomeRouteProvider>(() => _i7.HomeRouteProvider());
    gh.factory<_i8.LoginTransition>(() => _i8.LoginTransition());
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    gh.factory<_i10.SplashBloc>(() => _i10.SplashBloc());
    gh.factory<_i11.SplashRouteProvider>(() => _i11.SplashRouteProvider());
    gh.factory<_i12.TransitionFactory>(() => _i12.TransitionFactory(
          loginTransition: gh<_i8.LoginTransition>(),
          defaultTransition: gh<_i4.DefaultTransition>(),
        ));
    gh.lazySingleton<_i13.AppRouteFactory>(() => _i13.AppRouteFactory(
          splashRouteProvider: gh<_i11.SplashRouteProvider>(),
          transitionFactory: gh<_i12.TransitionFactory>(),
          homeRouteProvider: gh<_i7.HomeRouteProvider>(),
        ));
    gh.lazySingleton<_i14.AppRouter>(
        () => _i14.AppRouter(routeFactory: gh<_i13.AppRouteFactory>()));
    gh.factory<_i15.ConfigurationDataSource>(() =>
        _i16.ConfigurationPersistence(
            sharedPreferences: gh<_i9.SharedPreferences>()));
    gh.factory<_i17.ConfigurationRepository>(() => _i17.ConfigurationRepository(
        configurationDataSource: gh<_i15.ConfigurationDataSource>()));
    gh.factory<_i5.Dio>(
      () => networkModule.provideDevDio(
        gh<_i3.AuthenticationInterceptor>(),
        gh<_i6.FakeLoginInterceptor>(),
      ),
      instanceName: 'auth',
      registerFor: {_dev},
    );
    gh.factory<_i5.Dio>(
      () => networkModule.provideChatDevDio(
        gh<_i3.AuthenticationInterceptor>(),
        gh<_i6.FakeLoginInterceptor>(),
      ),
      instanceName: 'chat',
      registerFor: {_dev},
    );
    gh.factory<_i18.GetConfigurationUseCase>(() => _i18.GetConfigurationUseCase(
        configurationRepository: gh<_i19.ConfigurationRepository>()));
    gh.factory<_i20.GlobalBloc>(() => _i20.GlobalBloc(
        getConfigurationUseCase: gh<_i21.GetConfigurationUseCase>()));
    return this;
  }
}

class _$LocalModule extends _i22.LocalModule {}

class _$NetworkModule extends _i23.NetworkModule {}
