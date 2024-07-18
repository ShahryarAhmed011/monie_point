import 'package:easy_localization/easy_localization.dart';

import '../../domain/exceptions/app_exception.dart';

extension ExceptionExtensions on Exception {
  String get userMessage {
    if (this is AppException) {
      return (this as AppException).message;
    } else {
      return "generic_api_error".tr();
    }
  }
}