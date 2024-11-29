import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF57823D); // Purple 500
  static const Color body = Color(0xFFF8F8F8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Colors.grey;
  static const Color black = Colors.black;
  static const Color lineGrey = Color(0xFFD9D9D9);
  static const Color fillPrimary = Color(0xFF57823D);
  static const Color orange = Color(0xFFE9932C);

  static const LinearGradient customGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF57823D), // #57823D
      Color(0xFF3B5F26), // #3B5F26
    ],
  );
}
