import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/services/authentication_service.dart';
import 'package:shartflix/features/authentication/presentation/pages/login_page.dart';
import 'package:shartflix/features/profile/presentation/pages/profile_page.dart';
import 'package:shartflix/features/splash/page/splash_page.dart';

import '../../features/authentication/presentation/pages/register_page.dart';
import '../../features/home/presentation/pages/base_screen.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/update_profile_image_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellHomeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_home');
final GlobalKey<NavigatorState> _shellProfileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_profile');

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: SplashPage.path,
  observers: [GoRouterObserver(FirebaseAnalytics.instance)],
  redirect: (context, state) async {
    final currentLocation = state.matchedLocation;

    if (currentLocation == SplashPage.path) {}

    final protectedRoutes = [
      HomePage.path,
      ProfilePage.path,
      UpdateProfileImagePage.path,
    ];
    final isProtectedRoute = protectedRoutes.any(
      (route) => currentLocation.startsWith(route),
    );

    if (isProtectedRoute) {
      final isAuthenticated = await AuthenticationService.isAuthenticated();
      if (!isAuthenticated) {
        return LoginPage.path;
      }
    }

    final authPages = [LoginPage.path, RegisterPage.path];
    if (authPages.contains(currentLocation)) {
      final isAuthenticated = await AuthenticationService.isAuthenticated();
      if (isAuthenticated) {
        return HomePage.path;
      }
    }

    // Diğer durumlar için yönlendirme yapma
    return null;
  },
  routes: [
    GoRoute(
      path: SplashPage.path,
      name: SplashPage.name,
      pageBuilder: (context, state) =>
          _pageBuilder(state: state, child: const SplashPage()),
    ),
    GoRoute(
      path: LoginPage.path,
      name: LoginPage.name,
      pageBuilder: (context, state) =>
          _pageBuilder(state: state, child: const LoginPage()),
    ),
    GoRoute(
      path: RegisterPage.path,
      name: RegisterPage.name,
      pageBuilder: (context, state) =>
          _pageBuilder(state: state, child: const RegisterPage()),
    ),
    GoRoute(
      path: UpdateProfileImagePage.pathFromRegister,
      name: UpdateProfileImagePage.nameFromRegister,
      pageBuilder: (context, state) => _pageBuilder(
        state: state,
        child: const UpdateProfileImagePage(isComingFromProfile: false),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BaseScreen(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellHomeNavigatorKey,
          routes: [
            GoRoute(
              path: HomePage.path,
              name: HomePage.name,
              pageBuilder: (context, state) =>
                  _pageBuilder(state: state, child: const HomePage()),
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: UpdateProfileImagePage.path,
                  name: UpdateProfileImagePage.name,
                  pageBuilder: (context, state) {
                    final isComingFromProfile =
                        state.uri.queryParameters['fromProfile'] == 'true';
                    return _pageBuilder(
                      state: state,
                      child: UpdateProfileImagePage(
                        isComingFromProfile: isComingFromProfile,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellProfileNavigatorKey,
          routes: [
            GoRoute(
              path: ProfilePage.path,
              name: ProfilePage.name,
              pageBuilder: (context, state) =>
                  _pageBuilder(state: state, child: const ProfilePage()),
            ),
          ],
        ),
      ],
    ),
  ],
);

Page<T> _pageBuilder<T>({
  required GoRouterState state,
  required Widget child,
  bool maintainState = true,
  bool fullscreenDialog = false,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    restorationId: state.pageKey.value,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

class GoRouterObserver extends NavigatorObserver {
  final FirebaseAnalytics _analytics;

  GoRouterObserver(this._analytics);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _analytics.logScreenView(
      screenName: route.settings.name ?? 'unknown',
      screenClass: route.settings.name ?? 'unknown',
    );
    print(
      'MyTest didPush: ${route.settings.name}, Previous: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _analytics.logScreenView(
      screenName: previousRoute?.settings.name ?? 'unknown',
      screenClass: previousRoute?.settings.name ?? 'unknown',
    );

    print(
      'MyTest didPop: ${route.settings.name}, Previous: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print(
      'MyTest didRemove: ${route.settings.name}, Previous: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _analytics.logScreenView(
        screenName: newRoute.settings.name ?? 'unknown',
        screenClass: newRoute.settings.name ?? 'unknown',
      );
    }
    print(
      'MyTest didReplace: New: ${newRoute?.settings.name}, Old: ${oldRoute?.settings.name}',
    );
  }
}
