// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimerScreenState {
  Duration get timerDuration => throw _privateConstructorUsedError;
  Duration? get currentTimerDuration => throw _privateConstructorUsedError;
  TimerState get timerState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerScreenStateCopyWith<TimerScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerScreenStateCopyWith<$Res> {
  factory $TimerScreenStateCopyWith(
          TimerScreenState value, $Res Function(TimerScreenState) then) =
      _$TimerScreenStateCopyWithImpl<$Res, TimerScreenState>;
  @useResult
  $Res call(
      {Duration timerDuration,
      Duration? currentTimerDuration,
      TimerState timerState});
}

/// @nodoc
class _$TimerScreenStateCopyWithImpl<$Res, $Val extends TimerScreenState>
    implements $TimerScreenStateCopyWith<$Res> {
  _$TimerScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerDuration = null,
    Object? currentTimerDuration = freezed,
    Object? timerState = null,
  }) {
    return _then(_value.copyWith(
      timerDuration: null == timerDuration
          ? _value.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentTimerDuration: freezed == currentTimerDuration
          ? _value.currentTimerDuration
          : currentTimerDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerScreenStateCopyWith<$Res>
    implements $TimerScreenStateCopyWith<$Res> {
  factory _$$_TimerScreenStateCopyWith(
          _$_TimerScreenState value, $Res Function(_$_TimerScreenState) then) =
      __$$_TimerScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration timerDuration,
      Duration? currentTimerDuration,
      TimerState timerState});
}

/// @nodoc
class __$$_TimerScreenStateCopyWithImpl<$Res>
    extends _$TimerScreenStateCopyWithImpl<$Res, _$_TimerScreenState>
    implements _$$_TimerScreenStateCopyWith<$Res> {
  __$$_TimerScreenStateCopyWithImpl(
      _$_TimerScreenState _value, $Res Function(_$_TimerScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerDuration = null,
    Object? currentTimerDuration = freezed,
    Object? timerState = null,
  }) {
    return _then(_$_TimerScreenState(
      timerDuration: null == timerDuration
          ? _value.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentTimerDuration: freezed == currentTimerDuration
          ? _value.currentTimerDuration
          : currentTimerDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
    ));
  }
}

/// @nodoc

class _$_TimerScreenState extends _TimerScreenState {
  const _$_TimerScreenState(
      {this.timerDuration = const Duration(seconds: 10),
      this.currentTimerDuration,
      this.timerState = TimerState.initial})
      : super._();

  @override
  @JsonKey()
  final Duration timerDuration;
  @override
  final Duration? currentTimerDuration;
  @override
  @JsonKey()
  final TimerState timerState;

  @override
  String toString() {
    return 'TimerScreenState(timerDuration: $timerDuration, currentTimerDuration: $currentTimerDuration, timerState: $timerState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerScreenState &&
            (identical(other.timerDuration, timerDuration) ||
                other.timerDuration == timerDuration) &&
            (identical(other.currentTimerDuration, currentTimerDuration) ||
                other.currentTimerDuration == currentTimerDuration) &&
            (identical(other.timerState, timerState) ||
                other.timerState == timerState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, timerDuration, currentTimerDuration, timerState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerScreenStateCopyWith<_$_TimerScreenState> get copyWith =>
      __$$_TimerScreenStateCopyWithImpl<_$_TimerScreenState>(this, _$identity);
}

abstract class _TimerScreenState extends TimerScreenState {
  const factory _TimerScreenState(
      {final Duration timerDuration,
      final Duration? currentTimerDuration,
      final TimerState timerState}) = _$_TimerScreenState;
  const _TimerScreenState._() : super._();

  @override
  Duration get timerDuration;
  @override
  Duration? get currentTimerDuration;
  @override
  TimerState get timerState;
  @override
  @JsonKey(ignore: true)
  _$$_TimerScreenStateCopyWith<_$_TimerScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
