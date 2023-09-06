import 'package:flutter/material.dart';

class AppCircleButtonWithText extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final String? text;

  const AppCircleButtonWithText({
    Key? key,
    this.child,
    this.onTap,
    this.text,
  }) : super(key: key);

  @override
  State<AppCircleButtonWithText> createState() =>
      _AppCircleButtonWithTextState();
}

class _AppCircleButtonWithTextState extends State<AppCircleButtonWithText> {
  MaterialStatesController? _controller;

  late final Color _disabledColor = Colors.white12;
  late final Color _pressedColor = Colors.white60;
  late final Color _activeColor = Colors.white38;

  /// 0 - disabled, 1 - pressed, 2 - active
  final ValueNotifier<int> _buttonState = ValueNotifier(2);

  @override
  void initState() {
    super.initState();
    _controller = MaterialStatesController()
      ..addListener(_buttonStatesListener);
    _buttonStatesListener();
  }

  void _buttonStatesListener() {
    _buttonState.value =
        _controller?.value.contains(MaterialState.disabled) ?? false
            ? 0
            : _controller?.value.contains(MaterialState.pressed) ?? false
                ? 1
                : 2;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return CircleBorder(
                    side: BorderSide(width: 2, color: _disabledColor));
              } else if (states.contains(MaterialState.pressed)) {
                return CircleBorder(
                    side: BorderSide(width: 2, color: _pressedColor));
              }
              return CircleBorder(
                  side: BorderSide(width: 2, color: _activeColor));
            }),
            padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
            elevation: MaterialStateProperty.all(0),
          ),
          onPressed: widget.onTap,
          statesController: _controller,
          child: widget.child,
        ),
        if (widget.text?.isNotEmpty ?? false)
          ValueListenableBuilder(
            builder: (context, state, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.text!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: state == 0
                        ? _disabledColor
                        : state == 1
                            ? _pressedColor
                            : _activeColor,
                  ),
                ),
              );
            },
            valueListenable: _buttonState,
          )
      ],
    );
  }
}
