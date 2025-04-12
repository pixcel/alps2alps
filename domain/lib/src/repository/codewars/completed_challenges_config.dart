import 'package:domain/src/repository/base/repository_config.dart';

class CompletedChallengesConfig extends RepositoryConfig {
  CompletedChallengesConfig({
    required this.page,
    required this.userId,
  });

  static const int pageSize = 200;

  final int page;
  final String userId;
}
