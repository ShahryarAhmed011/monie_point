import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../domain/exceptions/remote_exception.dart';
import 'single_error_factory.dart';

class BadActionErrorFactory {
  final SingleErrorFactory _singleErrorExceptionFactory =
      const SingleErrorFactory();

  const BadActionErrorFactory();
  RemoteException create(DioError dioError) {
    Map<String, dynamic>? responseData = dioError.response?.data;
    if (responseData == null) {
      return const RemoteException.unknownNetworkException();
    }
    final String? message = responseData["message"];
    Map<String, dynamic>? error = responseData["error"];
    RemoteException? exception;
    if (error != null) {
      if (error.length > 1) {
        if (error["email"][0].toString() == "The email field is required.") {
          Map<String, dynamic>? error1 = {
            "email": "error_email_and_password_field_required".tr()
          };
          exception = _singleErrorExceptionFactory.create(error1, message);
        }
      } else {
        exception = _singleErrorExceptionFactory.create(error, message);
      }

      if (exception != null) return exception;
    }

    Map<String, dynamic>? errors = responseData["errors"];
    if (errors != null) {
      if (exception != null) return exception;
    }

    return const RemoteException.unknownNetworkException();
  }
}
