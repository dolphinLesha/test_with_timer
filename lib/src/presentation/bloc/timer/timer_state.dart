import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';

enum TimerState {
  playing,
  stopped,
  initial;

  const TimerState();

  bool get isPlaying => this == TimerState.playing;

  bool get isStopped => this == TimerState.stopped;

  bool get isInitial => this == TimerState.initial;
}

@freezed
class TimerScreenState with _$TimerScreenState {
  const TimerScreenState._();

  const factory TimerScreenState({
    @Default(Duration(seconds: 10)) Duration timerDuration,
    Duration? currentTimerDuration,
    @Default(TimerState.initial) TimerState timerState,
  }) = _TimerScreenState;

  double get progress {
    return currentTimerDuration == null
        ? 0
        : 1 -
            currentTimerDuration!.inMilliseconds / timerDuration.inMilliseconds;
  }
}
