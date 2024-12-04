import 'package:flutter/material.dart';
import 'package:flutter_tem/features/auth/screens/login_screen.dart';
import 'package:flutter_tem/features/main/screens/google_map_screen.dart';
import 'package:flutter_tem/features/main/screens/home_screen.dart';
import 'package:flutter_tem/features/main/screens/my_favorites_screen.dart';
import 'package:flutter_tem/features/main/screens/product_list_screen.dart';
import 'package:flutter_tem/features/main/screens/search_screen.dart';
import 'package:flutter_tem/routes/bottom_bar.dart';
import 'package:go_router/go_router.dart';
import '../features/main/screens/browse_screen.dart';
import '../features/order/screens/order_screen.dart';
import '../features/setting/screens/profile_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
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
          GoRoute(
            path: '/google-map',
            builder: (context, state) => const GoogleMapScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/product-list',
        builder: (context, state) => const ProductListScreen(),
      ),
      GoRoute(
        path: '/my-favorites',
        builder: (context, state) => const MyFavoritesScreen(),
      ),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(child: Text('Page not found')),
      );
    },
    redirect: (context, state) {
      // if the user is not logged in, they need to login

      // return '/login';
      return null;
    },
  );
}
