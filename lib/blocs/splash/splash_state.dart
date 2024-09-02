part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.loadingStatus,
  });
  final LoadingStatus? loadingStatus;
  @override
  List<Object> get props => [
        loadingStatus ?? LoadingStatus.initial,
      ];
  SplashState copyWith({
    LoadingStatus? loadingStatus,
  }) {
    return SplashState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
