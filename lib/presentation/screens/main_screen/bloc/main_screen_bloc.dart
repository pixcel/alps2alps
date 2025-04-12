import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenState()) {
    on<SetPickupLocation>(_onSetPickupLocation);
    on<SetDestinationLocation>(_onSetDestinationLocation);
    on<SetTime>(_onSetTime);
    on<AddPassengers>(_onAddPassengers);
    on<RemovePassengers>(_onRemovePassengers);
    on<FindTransport>(_onFindTransport);
  }

  FutureOr<void> _onSetPickupLocation(
    SetPickupLocation event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(state.copyWith(pickupLocation: event.location));
  }

  FutureOr<void> _onSetDestinationLocation(
    SetDestinationLocation event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(state.copyWith(destinationLocation: event.location));
  }

  FutureOr<void> _onSetTime(
    SetTime event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(state.copyWith(time: event.time));
  }

  FutureOr<void> _onAddPassengers(
    AddPassengers event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(state.copyWith(passengersCount: state.passengersCount + 1));
  }

  FutureOr<void> _onRemovePassengers(
    RemovePassengers event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        passengersCount:
            state.passengersCount > 0
                ? state.passengersCount - 1
                : state.passengersCount,
      ),
    );
  }

  FutureOr<void> _onFindTransport(
    FindTransport event,
    Emitter<MainScreenState> emit,
  ) async {
    // TODO: need to implement
  }
}
