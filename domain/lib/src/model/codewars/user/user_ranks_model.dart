import 'package:equatable/equatable.dart';

import 'user_rank_model.dart';

class UserRanksModel extends Equatable {
  final UserRankModel overall;

  final Map<String, UserRankModel> languages;

  const UserRanksModel({
    required this.overall,
    required this.languages,
  });

  @override
  List<Object> get props => [
        overall,
        languages,
      ];
}
