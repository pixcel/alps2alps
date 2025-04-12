import 'package:domain/src/model/config_model.dart';

abstract class ConfigRepository {
  /// Returns current app configuration
  ConfigModel get config;

  // /// Returns base APi url for communication with backend
  // String get baseApiUrl;

  /// Intended to set app configuration
  Future<void> initialize({required ConfigModel config});
}
