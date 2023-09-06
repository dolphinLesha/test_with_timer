import 'package:go_router/go_router.dart';
import 'package:test_with_timer/src/presentation/core/navigation/app_routes.dart';
import 'package:test_with_timer/src/presentation/modules/main_screen/navi/main_navi.dart';

class AppRouter extends GoRouter {
  static final AppRouter _appRouter = AppRouter._internal();

  factory AppRouter() {
    return _appRouter;
  }

  ///
  AppRouter._internal()
      : super(
          // I make redirection only for home page
          redirect: (context, state) {
            if (state.location == '/') {
              return AppRoutes.timerScreen;
            }
            return null;
          },
          initialLocation: AppRoutes.timerScreen,
          routes: [
            TimerRoute(
              routes: [
                TimerSettingRoute(),
              ],
            ),
          ],
        );
}
