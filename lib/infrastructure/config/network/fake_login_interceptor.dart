import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
@dev
class FakeLoginInterceptor extends InterceptorsWrapper {
  FakeLoginInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String route = options.path;
    if (route == "auth/login") {
      Map data = options.data;
      String? email = data["email"];
      String? password = data["password"];
      if (email?.isEmpty == true && password?.isEmpty == true) {
        data["email"] = "Bertrand7921@test.test";
        data["password"] = "1";
      }
      options.data = data;
    }
    super.onRequest(options, handler);
  }
}
