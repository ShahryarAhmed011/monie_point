import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data.dart';

@injectable
class AuthenticationInterceptor extends InterceptorsWrapper {
  static const instanceName = "log_interceptor";
  final List<String> routesWithoutToken = ["auth/login"];
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String route = options.path;
    if (!routesWithoutToken.contains(route)) {
      options.headers
          .addAll({"Authorization": "Bearer }"});
    }

    options.headers.addAll({"accept": "application/json"});
    super.onRequest(options, handler);
  }
}
