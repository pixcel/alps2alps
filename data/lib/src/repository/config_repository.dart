import 'package:domain/domain.dart' as domain;
import 'package:injectable/injectable.dart';

@LazySingleton(as: domain.ConfigRepository)
class ConfigRepository extends domain.ConfigRepository {
  late domain.ConfigModel _config;

  @override
  domain.ConfigModel get config => _config;

  @override
  String get baseApiUrl => _config.apiUrl;

  @override
  String get geocodingApiKey => _config.geocodingApiKey;

  @override
  Future<void> initialize({required domain.ConfigModel config}) async {
    _config = config;
  }
}
