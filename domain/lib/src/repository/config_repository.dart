import 'package:domain/src/model/config_model.dart';

abstract class ConfigRepository {
  /// Returns current app configuration
  ConfigModel get config;

  /// Returns base API url for communication with backend
  String get baseApiUrl;

  /// Returns API key for google geocoding service
  String get geocodingApiKey;

  /// Intended to set app configuration
  Future<void> initialize({required ConfigModel config});
}
