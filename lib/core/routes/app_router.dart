import 'package:go_router/go_router.dart';
import 'routes.dart';
import '../../features/splash/presentation/screens/splashview.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../widgets/main_layout.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const MainLayoutView(initialIndex: 0),
      ),
      GoRoute(
        path: Routes.scanner,
        builder: (context, state) => const MainLayoutView(initialIndex: 1),
      ),
      GoRoute(
        path: Routes.chat,
        builder: (context, state) => const MainLayoutView(initialIndex: 2),
      ),
      GoRoute(
        path: Routes.history,
        builder: (context, state) => const MainLayoutView(initialIndex: 3),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => const MainLayoutView(initialIndex: 4),
      ),
    ],
  );
}
