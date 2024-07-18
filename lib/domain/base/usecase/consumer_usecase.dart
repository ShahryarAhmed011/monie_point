import 'package:flutter/foundation.dart';
import '../../base/request.dart';
import '../../base/use_case_result.dart';
import '../../base/usecase/usecase.dart';
import '../../exceptions/app_exception.dart';
import 'consumer_result_use_case.dart';


abstract class ConsumerUseCase<Q extends Request> implements UseCase {
  @protected
  Future task(Q request);

  const ConsumerUseCase();

  Future perform(Q request, ConsumerUseCaseResult result) async {
    try {
      await task(request);
      result.onFinished?.call();
    } on Exception catch (exception) {
      result.onError?.call(exception);
    } catch (e) {
      result.onError?.call(AppException(message: e.toString()));
    }
  }
}
