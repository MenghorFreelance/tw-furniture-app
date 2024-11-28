import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/screens/home_screen.dart';
import '../features/auth/screens/second_screen.dart';

// This class will handle all route-related logic for the app
class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Home Screen Route
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeScreen();
        },
        routes: [
          // Second Screen Route
          GoRoute(
            path: '/second',
            builder: (context, state) {
              return const SecondScreen();
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(child: Text('Page not found')),
      );
    },
  );
}
