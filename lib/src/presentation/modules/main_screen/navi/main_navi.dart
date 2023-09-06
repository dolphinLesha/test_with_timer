import 'package:go_router/go_router.dart';
import 'package:test_with_timer/src/presentation/core/navigation/app_page.dart';
import 'package:test_with_timer/src/presentation/core/navigation/app_routes.dart';
import 'package:test_with_timer/src/presentation/modules/main_screen/setting_screen.dart';
import 'package:test_with_timer/src/presentation/modules/main_screen/timer_screen.dart';

class TimerRoute extends GoRoute {
  TimerRoute({
    List<RouteBase> routes = const [],
  }) : super(
          path: AppRoutes.timerScreen,
          pageBuilder: (context, _) => const AppPage(
            child: TimerScreen(),
          ),
          routes: routes,
        );
}

class TimerSettingRoute extends GoRoute {
  TimerSettingRoute()
      : super(
          path: AppRoutes.timerSettingsScreen,
          name: AppRoutes.timerSettingsScreen.toUpperCase(),
          pageBuilder: (context, _) => const AppPage(
            child: SettingScreen(),
          ),
        );
}
