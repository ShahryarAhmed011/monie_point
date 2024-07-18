

class AppException implements Exception {
  final String message;
  final bool isAuthenticationError;
  final String? extra;
  final bool needUserApprove;
  final bool networkError;

  const AppException(
      {this.isAuthenticationError = false,
      this.networkError = false,
      this.extra,
      required this.message,
      this.needUserApprove = false});

  const AppException.authenticationException({String? message})
      : message = message ?? "Authentication Exception",
        extra = "auth exception",
        networkError = false,
        needUserApprove = false,
        isAuthenticationError = true;

  const AppException.unknownException()
      : message = "unknown exception",
        extra = null,
        networkError = false,
        needUserApprove = false,
        isAuthenticationError = false;

  @override
  String toString() {
    return message;
  }
}
