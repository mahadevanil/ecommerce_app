import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rapidor/utils/enums.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashInit>(onSplashInit);
  }

  FutureOr<void> onSplashInit(event, emit) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(const SplashState(
      loadingStatus: LoadingStatus.success,
    ));
  }
}
