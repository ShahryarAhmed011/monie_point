import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart' hide LogInterceptor;
import '../../config/network/authentication_interceptor.dart';
import '../../config/network/fake_login_interceptor.dart';
import '../../config/network/log_interceptor.dart';
import '../app_dependency_component.dart';

@module
abstract class NetworkModule {
  @injectable
  @stage
  @prod
  @Named("auth")
  Dio provideDio(AuthenticationInterceptor authenticationInterceptor) {
    BaseOptions baseOptions = BaseOptions()
      ..baseUrl = "https://api.innoscripta.com/";
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(authenticationInterceptor);
    dio.interceptors.add(LogInterceptor());

    return dio;
  }

  @injectable
  @dev
  @Named("auth")
  Dio provideDevDio(AuthenticationInterceptor authenticationInterceptor,
      FakeLoginInterceptor fakeLoginInterceptor,) {
    BaseOptions baseOptions = BaseOptions()
      ..baseUrl = "https://api-testing.innoscripta.com/"
      ..receiveTimeout = const Duration(minutes: 2)
      ..connectTimeout = const Duration(minutes: 2);
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(authenticationInterceptor);
    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(fakeLoginInterceptor);

    return dio;
  }

  @injectable
  @stage
  @prod
  @Named("chat")
  Dio provideChatDio(AuthenticationInterceptor authenticationInterceptor) {
    BaseOptions baseOptions = BaseOptions()
      ..baseUrl = "https://livechat-api.innoscripta.com/";
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(authenticationInterceptor);
    dio.interceptors.add(LogInterceptor());



    return dio;
  }

  @injectable
  @dev
  @Named("chat")
  Dio provideChatDevDio(AuthenticationInterceptor authenticationInterceptor,
      FakeLoginInterceptor fakeLoginInterceptor) {
    BaseOptions baseOptions = BaseOptions()
      ..baseUrl = "https://livechat-api-testing.innoscripta.com/"
      ..receiveTimeout = const Duration(minutes: 2)
      ..connectTimeout = const Duration(minutes: 2);
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(authenticationInterceptor);
    dio.interceptors.add(LogInterceptor());

    dio.interceptors.add(fakeLoginInterceptor);
    return dio;
  }
}
