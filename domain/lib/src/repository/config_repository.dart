import 'package:domain/src/model/config_model.dart';

abstract class ConfigRepository {
  /// Returns current app configuration
  ConfigModel get config;

  /// Intended to set app configuration
  Future<void> initialize({required ConfigModel config});
}
