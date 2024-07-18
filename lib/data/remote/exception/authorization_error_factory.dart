import 'package:dio/dio.dart';

import '../../../domain/exceptions/remote_exception.dart';

class AuthorizationErrorFactory {
  const AuthorizationErrorFactory();
  UnAuthorizedException create(DioError error){
    final Map<String, dynamic>? errorJson = error.response?.data;
    if (errorJson == null) {
      return UnAuthorizedException();
    }
    dynamic errors = errorJson["error"];
    if (errors is String) {
      return UnAuthorizedException(message: errors);
    }
    if (errors is Map) {
      final dynamic errorValue = errors.values.first;
      if (errorValue is Iterable) {
        return UnAuthorizedException(message: errorValue.first);
      } else {
        return UnAuthorizedException(message: errorValue);
      }
    }
    return UnAuthorizedException();
  }
}