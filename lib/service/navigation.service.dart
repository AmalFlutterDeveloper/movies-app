import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/presentation/pages/home/home.page.dart';
import 'package:movies_app/presentation/pages/splash/splash.page.dart';

enum R { splash, home }

class NavigationService {
  NavigationService._();
  static final _key = GlobalKey<NavigatorState>();
  static final context = _key.currentState?.context;
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: R.splash.name,
        path: '/',
        builder: (context, state) => SplashPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: R.home.name,
        path: '/home',
        builder: (context, state) => HomePage(
          key: state.pageKey,
        ),
      )
    ],
  );
}
