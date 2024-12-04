import 'package:flutter/material.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';

class AppBarMain extends StatelessWidget {
  final Widget child;
  const AppBarMain({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.customGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
