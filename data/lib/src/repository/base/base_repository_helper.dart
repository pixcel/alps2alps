import 'package:data/src/di/global_aliases.dart';
import 'package:data/src/exception/api_exception.dart';
import 'package:domain/domain.dart' as domain;

mixin BaseRepositoryHelper {
  Future<domain.RepositoryResult<TD>> execute<TD>(
    Function executionFunction, {
    bool reportExceptionToExternal = true,
  }) async {
    try {
      return await executionFunction();
    } on ApiException catch (e, stackTrace) {
      logRepository.error(
        target: this,
        error: e,
        stackTrace: stackTrace,
      );
      return domain.RepositoryResult<TD>.completed(exception: e.map);
    } catch (e, stackTrace) {
      logRepository.error(
        target: this,
        error: e,
        stackTrace: stackTrace,
      );
      return domain.RepositoryResult<TD>.completed(
          exception: domain.RepositoryException.unknown);
    }
  }
}
