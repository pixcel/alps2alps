import 'dart:ui';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class ChallengeRankModel extends Equatable {
  final RankType rank;

  final String name;

  final Color color;

  const ChallengeRankModel({
    required this.rank,
    required this.name,
    required this.color,
  });

  @override
  List<Object> get props => [
        rank,
        name,
        color,
      ];
}
