
import 'app_exception.dart';

class RemoteException extends AppException {
  const RemoteException.unknownNetworkException()
      : super(
            message: "unknown network exception", isAuthenticationError: false);

  const RemoteException.badException(String message)
      : super(message: message, isAuthenticationError: false);

  const RemoteException.unauthorizedException()
      : super(message: "unauthorized", isAuthenticationError: true);

  const RemoteException.unProcessable({required String message})
      : super(message: message);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({String? message})
      : super.authenticationException(message: message);
}
