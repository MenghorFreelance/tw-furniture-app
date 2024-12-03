import 'package:flutter/material.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:get/get.dart';

import 'bindings/initial_binding.dart';
import 'routes/app_routes.dart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.white,
        // backgroundColor: Colors.grey[200],
        scaffoldBackgroundColor: AppColors.body,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 0,
            ), // Padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // Rounded corners
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: true,
      initialBinding: InitialBinding(),
      home: Router(
        routerDelegate: AppRoutes.router.routerDelegate,
        routeInformationParser: AppRoutes.router.routeInformationParser,
        routeInformationProvider: AppRoutes.router.routeInformationProvider,
      ),
    );
  }
}
