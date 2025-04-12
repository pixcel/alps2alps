part of 'splash_screen_bloc.dart';

class SplashScreenState extends Equatable {
  const SplashScreenState({
    this.loadingState = SplashScreenLoadingState.init,
  });

  final SplashScreenLoadingState loadingState;

  @override
  List<Object?> get props => [loadingState];

  SplashScreenState copyWith({
    SplashScreenLoadingState? loadingState,
  }) {
    return SplashScreenState(
      loadingState: loadingState ?? this.loadingState,
    );
  }
}

enum SplashScreenLoadingState {
  init,
  loading,
  completed,
}
