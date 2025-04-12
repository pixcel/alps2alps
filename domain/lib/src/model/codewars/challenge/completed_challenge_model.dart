import 'package:equatable/equatable.dart';

class CompletedChallengeModel extends Equatable {
  final String id;

  final String? name;

  final String? slug;

  final DateTime completedAt;

  final List<String> completedLanguages;

  const CompletedChallengeModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.completedAt,
    required this.completedLanguages,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        completedAt,
        completedLanguages,
      ];
}
