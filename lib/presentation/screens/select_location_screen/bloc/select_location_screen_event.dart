part of 'select_location_screen_bloc.dart';

sealed class SelectLocationScreenEvent extends Equatable {
  const SelectLocationScreenEvent();

  @override
  List<Object> get props => [];
}

class Initialize extends SelectLocationScreenEvent {
  const Initialize();
}

class SetLocation extends SelectLocationScreenEvent {
  const SetLocation({required this.location});

  final LatLng location;
}

class ResetLocation extends SelectLocationScreenEvent {
  const ResetLocation();
}
