import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX Flutter App',
      debugShowCheckedModeBanner: true,
      // initialBinding: InitialBinding(),
      // home: Router(
      //   routerDelegate: AppRoutes.router.routerDelegate,
      //   routeInformationParser: AppRoutes.router.routeInformationParser,
      //   routeInformationProvider: AppRoutes.router.routeInformationProvider,
      // ),
      home: Container(),
    );
  }
}
