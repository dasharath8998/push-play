import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pushplay/ui/auth/auth_home_page.dart';
import 'package:pushplay/ui/auth/forgot_password_page.dart';
import 'package:pushplay/ui/auth/login_page.dart';
import 'package:pushplay/ui/auth/signup_page.dart';
import 'package:pushplay/ui/dashboard/home_page.dart';
import 'package:pushplay/ui/splash_page.dart';

/// AppRoutes is the Root manager for the whole system
/// It checks permission and params of url based on that it will let user redirect
class AppRoutes {
  AppRoutes();

  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        }
      ),
      GoRoute(
        path: Routes.authHomepage,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthHomePage();
        }
      ),
      GoRoute(
        path: Routes.dashboard,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        }
      ),
      GoRoute(
        path: Routes.forgotPass,
        builder: (BuildContext context, GoRouterState state) {
          return const ForgotPasswordPage();
        }
      ),
      GoRoute(
        path: Routes.signup,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpPage();
        }
      ),
      GoRoute(
        path: Routes.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        }
      ),
    ],
  );

  // Future<void> authenticationCheck({required VRedirector vRedirector}) async {
  //   bool result = PreferenceManager.getBool(PrefConst.isLogin);
  //   if (!result) {
  //     vRedirector.to(Routes.login);
  //   }
  // }
}

/// List of the routes for the system
abstract class Routes {
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPass = '/forgot-password';
  static const notFound = '/not-found';
  static const dashboard = '/dashboard';
  static const splash = '/';
  static const authHomepage = '/auth-homepage';
  static const terms = '/anthem-terms';
}
