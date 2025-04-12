import 'package:data/data.dart' as data;

abstract class LogRepository {
  static Future<LogRepository> createInstance() async {
    return await data.LogRepository.createInstance();
  }

  void debug({required Object target, required Object message});

  void error({
    required Object target,
    required Object error,
    required StackTrace? stackTrace,
  });
}
