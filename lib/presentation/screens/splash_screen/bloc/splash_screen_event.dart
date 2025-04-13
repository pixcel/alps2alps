part of 'splash_screen_bloc.dart';

sealed class SplashScreenEvent {
  const SplashScreenEvent();
}

class Initialize extends SplashScreenEvent {
  const Initialize();
}
