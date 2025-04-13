part of 'select_location_screen_bloc.dart';

class SelectLocationScreenState extends Equatable {
  const SelectLocationScreenState({
    this.currentLocation,
    this.location,
    this.searching = false,
  });

  final LatLng? currentLocation;
  final LatLng? location;
  final bool searching;

  @override
  List<Object?> get props => [currentLocation, location, searching];

  SelectLocationScreenState copyWith({
    LatLng? currentLocation,
    LatLng? location,
    bool? searching,
    bool clearLocation = false,
  }) {
    return SelectLocationScreenState(
      currentLocation: currentLocation ?? this.currentLocation,
      location: clearLocation ? null : location ?? this.location,
      searching: searching ?? this.searching,
    );
  }
}
