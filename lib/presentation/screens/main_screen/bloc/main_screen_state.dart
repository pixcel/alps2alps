part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  const MainScreenState({
    this.pickupAddress,
    this.destinationAddress,
    this.passengersCount = 0,
    this.time,
    this.search = false,
  });

  final domain.AddressModel? pickupAddress;
  final domain.AddressModel? destinationAddress;
  final DateTime? time;
  final int passengersCount;
  final bool search;

  bool get isFilled =>
      pickupAddress != null &&
      destinationAddress != null &&
      time != null &&
      passengersCount > 0;

  @override
  List<Object?> get props => [
    pickupAddress,
    destinationAddress,
    passengersCount,
    time,
    search,
  ];

  MainScreenState copyWith({
    domain.AddressModel? pickupAddress,
    domain.AddressModel? destinationAddress,
    int? passengersCount,
    DateTime? time,
    bool? search,
  }) {
    return MainScreenState(
      pickupAddress: pickupAddress ?? this.pickupAddress,
      destinationAddress: destinationAddress ?? this.destinationAddress,
      passengersCount: passengersCount ?? this.passengersCount,
      time: time ?? this.time,
      search: search ?? this.search,
    );
  }
}
