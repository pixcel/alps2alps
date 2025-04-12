import 'package:domain/src/model/codewars/challenge/challenge_rank_model.dart';
import 'package:domain/src/model/codewars/challenge/challenge_user_model.dart';
import 'package:equatable/equatable.dart';

class CodeChallengeModel extends Equatable {
  final String id;

  final String name;

  final String slug;

  final String url;

  final String category;

  final String description;

  final List<String> tags;

  final List<String> languages;

  final ChallengeRankModel? rank;

  final ChallengeUserModel createdBy;

  final ChallengeUserModel? approvedBy;

  final int totalCompleted;

  final int totalAttempts;

  final int totalStars;

  final int voteScore;

  final DateTime publishedAt;

  final DateTime? approvedAt;

  const CodeChallengeModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.url,
    required this.category,
    required this.description,
    required this.tags,
    required this.languages,
    required this.rank,
    required this.createdBy,
    required this.approvedBy,
    required this.totalCompleted,
    required this.totalAttempts,
    required this.totalStars,
    required this.voteScore,
    required this.publishedAt,
    required this.approvedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        url,
        category,
        description,
        tags,
        languages,
        rank,
        createdBy,
        approvedBy,
        totalCompleted,
        totalAttempts,
        totalStars,
        voteScore,
        publishedAt,
        approvedAt,
      ];
}
