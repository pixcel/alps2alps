part of 'select_location_screen_bloc.dart';

class SelectLocationScreenState extends Equatable {
  const SelectLocationScreenState({
    this.pickupLocation,
    this.destinationLocation,
    this.passengersCount = 0,
    this.time,
  });

  final LatLng? pickupLocation;
  final LatLng? destinationLocation;
  final DateTime? time;
  final int passengersCount;

  @override
  List<Object?> get props => [
    pickupLocation,
    destinationLocation,
    passengersCount,
    time,
  ];

  SelectLocationScreenState copyWith({
    LatLng? pickupLocation,
    LatLng? destinationLocation,
    int? passengersCount,
    DateTime? time,
  }) {
    return SelectLocationScreenState(
      pickupLocation: pickupLocation ?? this.pickupLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      passengersCount: passengersCount ?? this.passengersCount,
      time: time ?? this.time,
    );
  }
}
