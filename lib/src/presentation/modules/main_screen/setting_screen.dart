import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_with_timer/src/presentation/bloc/timer/timer_cubit.dart';
import 'package:test_with_timer/src/presentation/common/buttons/app_filled_circle_button_with_text.dart';
import 'package:test_with_timer/src/presentation/common/layouts/app_background.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late _TimeValue _timeValue;
  late int _tickValue;

  @override
  void initState() {
    super.initState();
    _timeValue = _TimeValue.seconds;
    _tickValue = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Timer Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AppBackground(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Center(
                      child: _TimeValueInput(
                        initialTimeValue: _timeValue,
                        onValueChanged: (value) => _timeValue = value,
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Center(
                      child: _TimeTicksInput(
                        initialValue: _tickValue,
                        onValueChanged: (value) => _tickValue = value,
                      ),
                    ),
                  ),
                ],
              ),
              AppFilledCircleButtonWithText(
                text: 'Confirm',
                onTap: () {
                  if (_timeValue == _TimeValue.seconds) {
                    context
                        .read<TimerCubit>()
                        .setDuration(Duration(seconds: _tickValue));
                  } else if (_timeValue == _TimeValue.minutes) {
                    context
                        .read<TimerCubit>()
                        .setDuration(Duration(minutes: _tickValue));
                  } else {
                    context
                        .read<TimerCubit>()
                        .setDuration(Duration(hours: _tickValue));
                  }
                  context.pop();
                },
                child: const Icon(
                  Icons.check,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _TimeValue {
  hours('Hours'),
  minutes('Minutes'),
  seconds('Seconds');

  const _TimeValue(this.label);

  final String label;
}

class _TimeValueInput extends StatefulWidget {
  final _TimeValue initialTimeValue;
  final void Function(_TimeValue timeValue)? onValueChanged;

  const _TimeValueInput({
    Key? key,
    this.initialTimeValue = _TimeValue.seconds,
    this.onValueChanged,
  }) : super(key: key);

  @override
  State<_TimeValueInput> createState() => _TimeValueInputState();
}

class _TimeValueInputState extends State<_TimeValueInput> {
  final TextEditingController _timeValueController = TextEditingController();
  _TimeValue? _selectedTimeValue;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<_TimeValue>(
      controller: _timeValueController,
      label: const Text('Timer value'),
      dropdownMenuEntries: [
        for (final value in _TimeValue.values)
          DropdownMenuEntry<_TimeValue>(value: value, label: value.label),
      ],
      initialSelection: widget.initialTimeValue,
      inputDecorationTheme: const InputDecorationTheme(filled: true),
      onSelected: (value) {
        setState(() {
          _selectedTimeValue = value ?? _TimeValue.seconds;
          _timeValueController.value = _timeValueController.value.copyWith(
              text: _selectedTimeValue!.label,
              selection: TextSelection(
                  baseOffset: _selectedTimeValue!.label.length,
                  extentOffset: _selectedTimeValue!.label.length));
          widget.onValueChanged?.call(_selectedTimeValue!);
        });
      },
    );
  }

  @override
  void dispose() {
    _timeValueController.dispose();
    super.dispose();
  }
}

class _TimeTicksInput extends StatefulWidget {
  final int initialValue;
  final void Function(int value)? onValueChanged;

  const _TimeTicksInput({
    Key? key,
    this.initialValue = 1,
    this.onValueChanged,
  }) : super(key: key);

  @override
  State<_TimeTicksInput> createState() => _TimeTicksInputState();
}

class _TimeTicksInputState extends State<_TimeTicksInput> {
  final TextEditingController _valueController = TextEditingController();
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      controller: _valueController,
      label: const Text('Number'),
      dropdownMenuEntries: List.generate(
          60,
          (index) =>
              DropdownMenuEntry<int>(value: index + 1, label: '${index + 1}')),
      initialSelection: widget.initialValue,
      inputDecorationTheme: const InputDecorationTheme(filled: true),
      onSelected: (value) {
        setState(() {
          _selectedValue = value ?? 1;
          if (_selectedValue! < 1) _selectedValue = 1;
          if (_selectedValue! > 60) _selectedValue = 60;
          _valueController.value = _valueController.value.copyWith(
              text: _selectedValue!.toString(),
              selection: TextSelection(
                  baseOffset: _selectedValue!.toString().length,
                  extentOffset: _selectedValue!.toString().length));
          widget.onValueChanged?.call(_selectedValue!);
        });
      },
    );
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }
}
