import '../../base/request.dart';
import '../../base/use_case_result.dart';
import '../../base/usecase/usecase.dart';

abstract class StreamUseCase<Q extends Request, E> implements UseCase {
  const StreamUseCase();

  Stream<E> task(Q request);

  Stream<E> perform(Q request, UseCaseResult<Stream<E>> result) {
    try {
      return task(request);
    } on Exception catch (exception) {
      result.onError?.call(exception);
      return Stream.error(exception);
    } catch (e) {
      result.onError?.call(Exception(e.toString()));
      return Stream.error(Exception(e.toString()));
    }
  }
}
