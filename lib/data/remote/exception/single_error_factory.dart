
import '../../../domain/exceptions/remote_exception.dart';

class SingleErrorFactory {
  const SingleErrorFactory();

  RemoteException? create(Map<String, dynamic> response, String? message) {
    if (response.length == 1) {
      final value = response.values.first;
      if (value is Iterable) {
        return RemoteException.unProcessable(message: value.first.toString());
      } else {
        return RemoteException.unProcessable(message: value.toString());
      }
    }
    return null;
  }
}
