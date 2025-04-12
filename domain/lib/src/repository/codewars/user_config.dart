import 'package:domain/src/repository/base/repository_config.dart';

class UserConfig extends RepositoryConfig {
  UserConfig({
    required this.userId,
  });

  final String userId;
}
