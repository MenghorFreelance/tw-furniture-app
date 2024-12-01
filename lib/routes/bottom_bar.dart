import 'package:flutter/material.dart';
import 'package:flutter_tem/features/main/screens/browse_screen.dart';
import 'package:flutter_tem/features/main/screens/home_screen.dart';
import 'package:flutter_tem/features/order/screens/order_screen.dart';
import 'package:flutter_tem/features/setting/screens/profile_screen.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatefulWidget {
  final Widget child;

  const BottomBar({super.key, required this.child});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/browse');
        break;
      case 2:
        context.go('/order');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: GlobalKey<
            NavigatorState>(), // Key for Navigator to manage tab screens
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) {
              switch (_selectedIndex) {
                case 0:
                  return const HomeScreen();
                case 1:
                  return const BrowseScreen();
                case 2:
                  return const OrderScreen();
                case 3:
                  return const ProfileScreen();
                default:
                  return const HomeScreen();
              }
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
