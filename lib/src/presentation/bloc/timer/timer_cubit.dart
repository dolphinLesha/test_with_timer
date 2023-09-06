import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_with_timer/src/presentation/bloc/timer/timer_state.dart';
export 'timer_state.dart';

class TimerCubit extends Cubit<TimerScreenState> {
  Timer? _tickTimer;
  final int _tickInterval = 500;

  TimerCubit() : super(const TimerScreenState());

  void playPause() {
    if (state.timerState.isInitial) {
      emit(state.copyWith(
        currentTimerDuration: state.timerDuration,
        timerState: TimerState.stopped,
      ));
    }
    if (state.timerState.isPlaying) {
      emit(state.copyWith(
        timerState: TimerState.stopped,
      ));
      _tickTimer?.cancel();
    } else if (state.timerState.isStopped) {
      emit(state.copyWith(
        timerState: TimerState.playing,
      ));
      _tickTimer =
          Timer.periodic(Duration(milliseconds: _tickInterval), (timer) {
        emit(state.copyWith(
          currentTimerDuration: state.currentTimerDuration! -
              Duration(milliseconds: _tickInterval),
        ));
        if (state.currentTimerDuration == Duration.zero) {
          _tickTimer?.cancel();
          emit(state.copyWith(
            timerState: TimerState.initial,
          ));
        }
      });
    }
  }

  void cancel() {
    _tickTimer?.cancel();
    emit(state.copyWith(
      timerState: TimerState.initial,
      currentTimerDuration: null,
    ));
  }

  void setDuration(Duration duration) {
    cancel();
    emit(state.copyWith(timerDuration: duration));
  }
}
