import 'package:flutter/material.dart';
import 'package:flutter_tem/features/auth/screens/login_screen.dart';
import 'package:flutter_tem/features/main/screens/home_screen.dart';
import 'package:flutter_tem/routes/bottom_bar.dart';
import 'package:go_router/go_router.dart';
import '../features/main/screens/browse_screen.dart';
import '../features/order/screens/order_screen.dart';
import '../features/setting/screens/profile_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/profile',
    routes: [
      // ShellRoute to manage bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          return BottomBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/browse',
            builder: (context, state) => const BrowseScreen(),
          ),
          GoRoute(
            path: '/order',
            builder: (context, state) => const OrderScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(child: Text('Page not found')),
      );
    },
    redirect: (context, state) {
      // if the user is not logged in, they need to login
      String? token;

      // return '/login';
      return "/login";
    },
  );
}
