
import 'package:dio/dio.dart';

import '../../../domain/exceptions/remote_exception.dart';
import 'authorization_error_factory.dart';
import 'bad_action_error_factory.dart';


class RemoteExceptionFactory {
  final BadActionErrorFactory _badActionErrorFactory =
      const BadActionErrorFactory();
  final AuthorizationErrorFactory _authorizationErrorFactory =
      const AuthorizationErrorFactory();

  const RemoteExceptionFactory();

  RemoteException create(DioError error) {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      throw _authorizationErrorFactory.create(error);
    }

    if (error.response?.statusCode == 422) {
      return _badActionErrorFactory.create(error);
    }

    String? errorMessage = error.response?.data["message"];

    if (errorMessage != null) {
      return RemoteException.badException(errorMessage);
    }

    return const RemoteException.unknownNetworkException();
  }

}
