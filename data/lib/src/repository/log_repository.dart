import 'dart:async';

import 'package:domain/domain.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: domain.LogRepository)
class LogRepository extends domain.LogRepository {
  final _logger = Logger();

  static Future<LogRepository> createInstance() async {
    return LogRepository();
  }

  @override
  void debug({required Object message, required Object target}) {
    final name = target.runtimeType.toString();
    _logger.d('$name: $message', time: DateTime.now());
  }

  @override
  void error({
    required Object error,
    required StackTrace? stackTrace,
    required Object target,
    bool reportToExternal = true,
  }) {
    // Change kRelease mode to kDebugMode for testing purposes
    final name = target.runtimeType.toString();
    final message = error.toString();
    _logger.d('$name: $message',
        time: DateTime.now(), error: error, stackTrace: stackTrace);
  }
}
