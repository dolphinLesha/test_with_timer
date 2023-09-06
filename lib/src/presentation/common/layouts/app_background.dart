import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget? child;

  const AppBackground({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColorDark,
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
