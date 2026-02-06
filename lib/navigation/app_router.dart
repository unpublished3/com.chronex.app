import 'package:chronex/navigation/app_router_path.dart';
import 'package:chronex/presentation/onboard/onboard_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [GoRoute(path: AppRouterPath.initial, builder: (context, state) => const OnboardScreen())],
);
