import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class AuthoredChallengeModel extends Equatable {
  final String id;

  final String name;

  final String description;

  final RankType rank;

  final String rankName;

  final List<String> tags;

  final List<String> languages;

  const AuthoredChallengeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rank,
    required this.rankName,
    required this.tags,
    required this.languages,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        rank,
        rankName,
        tags,
        languages,
      ];
}
