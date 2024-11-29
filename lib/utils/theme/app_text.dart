import 'package:flutter/material.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';

class AppText {
  // Example: Title style
  static TextStyle title({
    Color? color = AppColors.black,
    double? fontSize = 14,
    FontWeight? fontWeight = FontWeight.w400,
    TextStyle? extraStyles,
    bool underline = false,
    Color underlineColor = AppColors.white,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: underline ? underlineColor : Colors.transparent,
    ).merge(extraStyles);
  }
}
