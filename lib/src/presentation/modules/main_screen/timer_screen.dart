import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_with_timer/src/data/common/extensions/duration_extension.dart';
import 'package:test_with_timer/src/presentation/bloc/timer/timer_cubit.dart';
import 'package:test_with_timer/src/presentation/common/buttons/app_circle_button_with_text.dart';
import 'package:test_with_timer/src/presentation/common/buttons/app_filled_circle_button_with_text.dart';
import 'package:test_with_timer/src/presentation/common/layouts/app_background.dart';
import 'dart:math' as math;

import 'package:test_with_timer/src/presentation/core/navigation/app_routes.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Timer',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
              ),
              child: const Text(
                'Timer App',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Set duration'),
              onTap: () {
                Navigator.of(context).pop();
                context.pushNamed(AppRoutes.timerSettingsScreen.toUpperCase());
              },
            ),
          ],
        ),
      ),
      body: const AppBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TimerWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: _ControlButtons(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TimerWidget extends StatelessWidget {
  const _TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 280,
        maxHeight: 280,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: BlocBuilder<TimerCubit, TimerScreenState>(
            buildWhen: (p, n) =>
                p.currentTimerDuration != n.currentTimerDuration ||
                p.timerDuration != n.timerDuration,
            builder: (context, state) {
              return CustomPaint(
                painter: _ArcPainter(
                  color: Theme.of(context).primaryColorLight,
                  backgroundColor:
                      Theme.of(context).primaryColorLight.withOpacity(0.2),
                  progress: state.progress,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text(
                      state.currentTimerDuration == null
                          ? state.timerDuration.convertToTime
                          : state.currentTimerDuration!.convertToTime,
                      style: TextStyle(
                        fontSize: 48,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final Color color;
  final Color backgroundColor;

  /// If progress is 0, the arc won't be visible, 0.5 means that arc fills 90 agrees
  final double progress;

  const _ArcPainter({
    required this.color,
    required this.backgroundColor,
    required this.progress,
  }) : assert(progress <= 1.0 && progress >= 0,
            'Parameter progress must be from 0.0 up to 1.0');

  @override
  void paint(Canvas canvas, Size size) {
    Rect drawingRect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    final Paint paint = Paint();
    paint.strokeCap = StrokeCap.round;
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4;
    paint.maskFilter = const MaskFilter.blur(BlurStyle.solid, 3);

    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..maskFilter = null;

    canvas.drawArc(
      drawingRect,
      -math.pi / 2,
      math.pi * 2,
      false,
      backgroundPaint,
    );

    canvas.drawArc(
      drawingRect,
      -math.pi / 2,
      math.pi * progress * 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcPainter oldDelegate) {
    return color != oldDelegate.color || progress != oldDelegate.progress;
  }
}

class _ControlButtons extends StatelessWidget {
  const _ControlButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: BlocBuilder<TimerCubit, TimerScreenState>(
            buildWhen: (p, n) => p.timerState != n.timerState,
            builder: (context, state) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!state.timerState.isInitial)
                    Flexible(
                      fit: FlexFit.tight,
                      child: AppCircleButtonWithText(
                        onTap: () {
                          context.read<TimerCubit>().cancel();
                        },
                        text: 'Cancel',
                        child: const Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: AppFilledCircleButtonWithText(
                      onTap: () {
                        context.read<TimerCubit>().playPause();
                      },
                      text: state.timerState.isPlaying ? 'Pause' : 'Play',
                      child: Icon(
                        state.timerState.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
