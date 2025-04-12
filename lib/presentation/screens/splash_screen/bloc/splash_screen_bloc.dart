import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc({
    required this.splashScreenDelay,
  }) : super(const SplashScreenState()) {
    on<Initialize>(_onInitialize);
  }

  final int splashScreenDelay;

  Future<void> _onInitialize(
    Initialize event,
    Emitter<SplashScreenState> emit,
  ) async {
    if (state.loadingState == SplashScreenLoadingState.init) {
      emit(
        state.copyWith(
          loadingState: SplashScreenLoadingState.loading,
        ),
      );

      await Future.delayed(Duration(seconds: splashScreenDelay));

      emit(
        state.copyWith(
          loadingState: SplashScreenLoadingState.completed,
        ),
      );
    }
  }
}
