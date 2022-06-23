import 'package:go_router/go_router.dart';
import 'package:imagineapp_test_gap/src/features/home/presentation/pages/home_page.dart';
import 'package:imagineapp_test_gap/src/features/splash/presentation/pages/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
