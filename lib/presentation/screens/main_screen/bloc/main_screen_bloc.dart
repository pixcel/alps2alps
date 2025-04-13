import 'dart:async';

import 'package:domain/domain.dart' as domain;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc({required this.mapRepository}) : super(MainScreenState()) {
    on<SetPickupLocation>(_onSetPickupLocation);
    on<SetDestinationLocation>(_onSetDestinationLocation);
    on<SetTime>(_onSetTime);
    on<AddPassengers>(_onAddPassengers);
    on<RemovePassengers>(_onRemovePassengers);
    on<FindTransport>(_onFindTransport);
  }

  final domain.MapRepository mapRepository;

  FutureOr<void> _onSetPickupLocation(
    SetPickupLocation event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(state.copyWith(pickupAddress: event.address));
  }

  FutureOr<void> _onSetDestinationLocation(
    SetDestinationLocation event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(state.copyWith(destinationAddress: event.address));
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
    if (!state.search &&
        state.pickupAddress != null &&
        state.destinationAddress != null &&
        state.time != null &&
        state.passengersCount > 0) {
      emit(state.copyWith(search: true));

      final result = await mapRepository.findTransport(
        config: domain.FindTransportConfig(
          pickupAddress: state.pickupAddress!,
          destinationAddress: state.destinationAddress!,
          time: state.time!,
          passengersCount: state.passengersCount,
        ),
      );

      emit(state.copyWith(search: false));

      if (result.hasData) {
        // TODO:
      } else {
        // TODO:
      }
    }
  }
}
