import 'package:equatable/equatable.dart';

class UserCodeChallengesModel extends Equatable {
  final int totalAuthored;

  final int totalCompleted;

  const UserCodeChallengesModel({
    required this.totalAuthored,
    required this.totalCompleted,
  });

  @override
  List<Object> get props => [
        totalAuthored,
        totalCompleted,
      ];
}
