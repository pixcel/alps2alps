import 'dart:async';

import 'package:domain/domain.dart' as domain;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'select_location_screen_event.dart';

part 'select_location_screen_state.dart';

class SelectLocationScreenBloc
    extends Bloc<SelectLocationScreenEvent, SelectLocationScreenState> {
  SelectLocationScreenBloc({required this.mapRepository})
    : super(SelectLocationScreenState()) {
    on<Initialize>(_onInitialize);
    on<SetLocation>(_onSetLocation);
    on<ResetLocation>(_onResetLocation);
  }

  final domain.MapRepository mapRepository;

  FutureOr<void> _onInitialize(
    Initialize event,
    Emitter<SelectLocationScreenState> emit,
  ) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    emit(
      state.copyWith(
        currentLocation: LatLng(position.latitude, position.longitude),
      ),
    );
  }

  FutureOr<void> _onSetLocation(
    SetLocation event,
    Emitter<SelectLocationScreenState> emit,
  ) async {
    var state = this.state;

    emit(
      state.copyWith(
        location: event.location,
        searching: true,
        clearAddress: true,
      ),
    );

    final result = await mapRepository.getAddress(
      config: domain.AddressConfig(location: event.location),
    );

    state = this.state;

    if (result.hasData) {
      if (state.location == result.data?.location) {
        emit(
          state.copyWith(
            location: event.location,
            searching: false,
            address: result.data,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          location: event.location,
          searching: false,
          clearAddress: true,
        ),
      );
    }
  }

  FutureOr<void> _onResetLocation(
    ResetLocation event,
    Emitter<SelectLocationScreenState> emit,
  ) async {
    emit(
      state.copyWith(clearLocation: true, clearAddress: true, searching: false),
    );
  }
}
