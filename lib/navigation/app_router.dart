import 'package:chronex/navigation/app_router_path.dart';
import 'package:chronex/presentation/main/home_page.dart';
// import 'package:chronex/presentation/main/landing_page.dart';
// import 'package:chronex/presentation/main/active_run_track_pause.dart';
import 'package:chronex/presentation/main/main_page.dart';
// import 'package:chronex/presentation/onboard/onboard_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRouterPath.initial,
      builder: (context, state) => const HomePage(), //changed here for testing
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouterPath.home,
              builder: (context, state) =>
                  const HomePage(), // changed here for testing
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) =>
          MainPage(child: navigationShell),
    ),
  ],
);
