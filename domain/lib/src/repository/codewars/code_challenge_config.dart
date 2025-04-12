import 'package:domain/src/repository/base/repository_config.dart';

class CodeChallengeConfig extends RepositoryConfig {
  CodeChallengeConfig._({
    required this.id,
    required this.slug,
  });

  factory CodeChallengeConfig.withId(String value) {
    return CodeChallengeConfig._(id: value, slug: null);
  }

  factory CodeChallengeConfig.withSlug(String value) {
    return CodeChallengeConfig._(id: null, slug: value);
  }

  final String? id;
  final String? slug;

  String get challenge => id ?? slug ?? '';
}
