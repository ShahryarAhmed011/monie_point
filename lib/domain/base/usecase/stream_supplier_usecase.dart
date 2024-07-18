import '../../base/use_case_result.dart';
import '../../base/usecase/usecase.dart';

abstract class StreamSupplierUseCase<E> implements UseCase {
  const StreamSupplierUseCase();
  Stream<E> task();

  Stream<E> perform(UseCaseResult result) {
    try {
      return task();
    } on Exception catch (exception) {
      result.onError?.call(exception);
      return Stream.error(exception);
    } catch (e) {
      result.onError?.call(Exception(e.toString()));
      return Stream.error(Exception(e.toString()));
    }
  }
}
