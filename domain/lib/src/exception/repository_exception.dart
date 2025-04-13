import 'package:domain/src/exception/base_repository_exception.dart';

enum RepositoryException implements BaseRepositoryException {
  unknown,
  internal,
  connection,
}
