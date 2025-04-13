part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  const MainScreenState({
    this.pickupAddress,
    this.destinationAddress,
    this.passengersCount = 0,
    this.time,
    this.search = false,
    this.transports,
  });

  final domain.AddressModel? pickupAddress;
  final domain.AddressModel? destinationAddress;
  final DateTime? time;
  final int passengersCount;
  final bool search;
  final List<domain.TransportModel>? transports;

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
    transports,
  ];

  MainScreenState copyWith({
    domain.AddressModel? pickupAddress,
    domain.AddressModel? destinationAddress,
    int? passengersCount,
    DateTime? time,
    bool? search,
    List<domain.TransportModel>? transports,
    bool cleanTransports = false,
    bool reset = false,
  }) {
    return MainScreenState(
      pickupAddress: reset ? null : pickupAddress ?? this.pickupAddress,
      destinationAddress:
          reset ? null : destinationAddress ?? this.destinationAddress,
      passengersCount: reset ? 0 : passengersCount ?? this.passengersCount,
      time: reset ? null : time ?? this.time,
      search: search ?? this.search,
      transports: cleanTransports ? null : transports ?? this.transports,
    );
  }
}
