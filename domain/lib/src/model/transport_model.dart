import 'package:equatable/equatable.dart';

class TransportModel extends Equatable {
  final String name;

  const TransportModel({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}
