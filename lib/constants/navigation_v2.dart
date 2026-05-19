import 'package:skillsync/barrel_file.dart';
import 'package:skillsync/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

enum MainRoutes {
  home('home');

  const MainRoutes(this.routeName);

  final String routeName;
}

class NavigationV2 {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static List<String> publicRoutes = [MainRoutes.home.routeName];

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final isGoingToPublic = NavigationV2.publicRoutes.contains(state.topRoute?.name);
      final isLoggedIn = sl.authenticationCubit.state.main.isAuthenticated;

      if (!isGoingToPublic && !isLoggedIn) return '/home';
      return state.uri.toString();
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MainHomeScreen()),
      GoRoute(path: '/home', name: MainRoutes.home.routeName, builder: (context, state) => const MainHomeScreen()),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Route Error')),
      body: Center(child: Text("This path doesn't exist: ${state.uri.toString()}")),
    ),
  );

  static void showHomeScreen(BuildContext context) {
    HapticFeedback.heavyImpact();
    context.goNamed(MainRoutes.home.routeName);
  }
}
