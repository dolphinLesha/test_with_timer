import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_with_timer/src/presentation/bloc/timer/timer_cubit.dart';
import 'package:test_with_timer/src/presentation/core/navigation/app_router.dart';
import 'package:test_with_timer/src/presentation/core/theme/app_themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerCubit>(
      create: (context) => TimerCubit(),
      child: MaterialApp.router(
        themeMode: ThemeMode.dark,
        theme: AppThemes.lightTheme(),
        darkTheme: AppThemes.darkTheme(),
        routeInformationParser: AppRouter().routeInformationParser,
        routeInformationProvider: AppRouter().routeInformationProvider,
        routerDelegate: AppRouter().routerDelegate,
        backButtonDispatcher: AppRouter().backButtonDispatcher,
      ),
    );
  }
}
