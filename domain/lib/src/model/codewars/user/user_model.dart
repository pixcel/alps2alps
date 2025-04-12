import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String username;
  final String name;
  final int honor;
  final String clan;
  final int leaderboardPosition;
  final List<String> skills;
  final UserCodeChallengesModel codeChallenges;
  final UserRanksModel ranks;

  const UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.honor,
    required this.clan,
    required this.leaderboardPosition,
    required this.skills,
    required this.codeChallenges,
    required this.ranks,
  });

  @override
  List<Object> get props => [
        id,
        username,
        name,
        honor,
        clan,
        leaderboardPosition,
        skills,
        codeChallenges,
        ranks,
      ];
}
