import 'dart:ui';

import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class UserRankModel extends Equatable {
  final RankType rank;
  final String name;
  final Color color;
  final int score;

  const UserRankModel({
    required this.rank,
    required this.name,
    required this.color,
    required this.score,
  });

  @override
  List<Object> get props => [
        rank,
        name,
        color,
        score,
      ];
}
