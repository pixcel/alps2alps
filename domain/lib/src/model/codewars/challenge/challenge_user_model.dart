import 'package:equatable/equatable.dart';

class ChallengeUserModel extends Equatable {
  final String username;

  final String url;

  const ChallengeUserModel({
    required this.username,
    required this.url,
  });

  @override
  List<Object> get props => [
        username,
        url,
      ];
}
