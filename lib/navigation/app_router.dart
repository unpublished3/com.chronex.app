import 'package:chronex/navigation/app_router_path.dart';
import 'package:chronex/presentation/main/histrory_page.dart';
import 'package:chronex/presentation/main/home_page.dart';
// import 'package:chronex/presentation/main/landing_page.dart';
// import 'package:chronex/presentation/main/active_run_track_play.dart';
import 'package:chronex/presentation/main/main_page.dart';
import 'package:chronex/presentation/main/profile_page.dart';
// import 'package:chronex/presentation/onboard/onboard_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AppRouterPath.home, // changed her for testing
  routes: [
    // GoRoute(
    //   path: AppRouterPath.initial,
    //   builder: (context, state) => const LandingPage(),
    // ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouterPath.home,
              builder: (context, state) => const HomePage(name: 'Harry'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouterPath.history,
              builder: (context, state) => const HistroryPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouterPath.profile,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) =>
          MainPage(child: navigationShell),
    ),
  ],
);
