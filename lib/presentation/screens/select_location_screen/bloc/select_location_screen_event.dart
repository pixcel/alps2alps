part of 'select_location_screen_bloc.dart';

sealed class SelectLocationScreenEvent extends Equatable {
  const SelectLocationScreenEvent();

  @override
  List<Object> get props => [];
}

class SetPickupLocation extends SelectLocationScreenEvent {
  const SetPickupLocation({required this.location});

  final LatLng location;
}

class SetDestinationLocation extends SelectLocationScreenEvent {
  const SetDestinationLocation({required this.location});

  final LatLng location;
}

class SetTime extends SelectLocationScreenEvent {
  const SetTime({required this.time});

  final DateTime time;
}

class AddPassengers extends SelectLocationScreenEvent {
  const AddPassengers();
}

class RemovePassengers extends SelectLocationScreenEvent {
  const RemovePassengers();
}
