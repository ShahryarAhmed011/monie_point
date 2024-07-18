import '../../base/request.dart';
import '../../base/use_case_result.dart';
import '../../base/usecase/usecase.dart';
import '../../exceptions/app_exception.dart';



abstract class SingleUseCase<Q extends Request, E> implements UseCase {
  const SingleUseCase();

  Future<E> task(Q request);

  Future perform(Q request, UseCaseResult<E> result) async {
    try {
      E data = await task(request);
      result.onSuccess?.call(data);
    } on Exception catch (exception) {
      result.onError?.call(exception);
    } catch (e) {
      result.onError?.call(AppException(message: e.toString()));
    }
    result.onFinished?.call();
  }
}
