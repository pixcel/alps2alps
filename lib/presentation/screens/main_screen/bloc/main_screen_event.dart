part of 'main_screen_bloc.dart';

sealed class MainScreenEvent extends Equatable {
  const MainScreenEvent();

  @override
  List<Object> get props => [];
}

class SetPickupLocation extends MainScreenEvent {
  const SetPickupLocation({required this.location});

  final LatLng location;
}

class SetDestinationLocation extends MainScreenEvent {
  const SetDestinationLocation({required this.location});

  final LatLng location;
}

class SetTime extends MainScreenEvent {
  const SetTime({required this.time});

  final DateTime time;
}

class AddPassengers extends MainScreenEvent {
  const AddPassengers();
}

class RemovePassengers extends MainScreenEvent {
  const RemovePassengers();
}

class FindTransport extends MainScreenEvent {
  const FindTransport();
}
