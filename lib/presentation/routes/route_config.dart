import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redoq/presentation/routes/route_names.dart';
import 'package:redoq/presentation/features/main_section/update_user_details_section/views/screens/update_user_details_screen.dart';
import 'package:redoq/presentation/features/main_section/view_users_section/views/screens/view_users_details_screen.dart';
import 'package:redoq/presentation/features/onboarding_section/splash_screen_section/views/screens/splash_screen.dart';
import 'package:redoq/utils/transitions/screen_transitions.dart';

class RedoqRouteConfig {
  static final routeConfig = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: RedoqRouteNames.splashScreen,
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: SplashScreen());
      },
    ),
    GoRoute(
      name: RedoqRouteNames.viewUsersDetailsScreen,
      path: '/viewUsersDetails',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            child: const ViewUserDetailsScreen(),
            transitionDuration: const Duration(milliseconds: 330),
            transitionsBuilder: ScreenTransitions().slideTransitionRightToLeft);
      },
    ),
    GoRoute(
      name: RedoqRouteNames.updateUserDetailsScreen,
      path: '/updateUserDetails/:userId',
      pageBuilder: (context, state) {
        final userId = state.pathParameters['userId']!;
        return CustomTransitionPage(
            child: UpdateUserDetailsScreen(userId: userId),
            transitionDuration: const Duration(milliseconds: 330),
            transitionsBuilder: ScreenTransitions().slideTransitionRightToLeft);
      },
    ),
  ]);
}
