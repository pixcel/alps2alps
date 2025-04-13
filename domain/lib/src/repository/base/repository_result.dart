import 'package:domain/src/exception/base_repository_exception.dart';

class RepositoryResult<T> {
  T? data;
  BaseRepositoryException? exception;

  RepositoryResult.completed({
    this.data,
    this.exception,
  }) : assert(data != null || exception != null);

  bool get hasData => data != null;

  @override
  String toString() {
    return 'RepositoryResult{data: $data, exception: $exception}';
  }
}
