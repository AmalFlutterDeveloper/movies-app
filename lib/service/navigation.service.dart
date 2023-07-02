import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/presentation/pages/home/home.page.dart';
import 'package:movies_app/presentation/pages/sign_in/sign_in.page.dart';
import 'package:movies_app/presentation/pages/sign_in_up/sign_in_up.page.dart';
import 'package:movies_app/presentation/pages/sign_up/sign_up.page.dart';
import 'package:movies_app/presentation/pages/splash/splash.page.dart';

enum R {
  splash,
  home,
  signIn,
  signUp,
  signInUp,
}

class NavigationService {
  NavigationService._();
  static final _key = GlobalKey<NavigatorState>();
  static BuildContext? get context => _key.currentState?.context;
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: R.splash.name,
        path: '/',
        builder: (_, state) => SplashPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: R.home.name,
        path: '/home',
        builder: (_, state) => HomePage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: R.signInUp.name,
        path: '/signInUp',
        builder: (_, state) => SignInUpPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: R.signUp.name,
        path: '/signUp',
        builder: (_, state) => SignUpPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: R.signIn.name,
        path: '/signIn',
        builder: (_, state) => SignInPage(
          key: state.pageKey,
        ),
      ),
    ],
  );
}
