import 'package:domain/domain.dart';

abstract class CodewarsRepository {
  /// Returns user details
  Future<RepositoryResult<UserModel>> getUser({
    required UserConfig config,
  });

  /// Returns user authored challenges
  Future<RepositoryResult<List<AuthoredChallengeModel>>> getAuthoredChallenges({
    required UserConfig config,
  });

  /// Returns user completed challenges
  Future<RepositoryResult<List<CompletedChallengeModel>>>
      getCompletedChallenges({
    required CompletedChallengesConfig config,
  });

  /// Returns user completed challenges
  Future<RepositoryResult<CodeChallengeModel>> getCodeChallenge({
    required CodeChallengeConfig config,
  });
}
