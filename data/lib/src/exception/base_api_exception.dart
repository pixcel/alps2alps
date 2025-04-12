class BaseApiException {
  final Exception exception;
  final dynamic rawException;
  final StackTrace stackTrace;

  BaseApiException({
    required this.exception,
    required this.rawException,
    required this.stackTrace,
  });

  @override
  String toString() {
    return 'BaseApiException{exception: $exception\nrawException: $rawException}';
  }
}
