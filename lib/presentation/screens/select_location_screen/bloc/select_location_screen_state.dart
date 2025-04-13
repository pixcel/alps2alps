part of 'select_location_screen_bloc.dart';

class SelectLocationScreenState extends Equatable {
  const SelectLocationScreenState({
    this.currentLocation,
    this.location,
    this.address,
    this.searching = false,
  });

  final LatLng? currentLocation;
  final LatLng? location;
  final domain.AddressModel? address;
  final bool searching;

  @override
  List<Object?> get props => [currentLocation, location, searching, address];

  SelectLocationScreenState copyWith({
    LatLng? currentLocation,
    LatLng? location,
    domain.AddressModel? address,
    bool? searching,
    bool clearLocation = false,
    bool clearAddress = false,
  }) {
    return SelectLocationScreenState(
      currentLocation: currentLocation ?? this.currentLocation,
      location: clearLocation ? null : location ?? this.location,
      address: clearAddress ? null : address ?? this.address,
      searching: searching ?? this.searching,
    );
  }
}
