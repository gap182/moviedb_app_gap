import 'package:go_router/go_router.dart';
import 'package:imagineapp_test_gap/src/features/main/presentation/pages/main_page.dart';
import 'package:imagineapp_test_gap/src/features/splash/presentation/pages/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => const MainPage(),
    ),
  ],
);
