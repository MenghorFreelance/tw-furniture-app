import 'package:flutter/material.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  // Custom method to show a toast message
  static void showToast({
    required String message,
    Toast? toastLength = Toast.LENGTH_SHORT,
    ToastGravity? gravity = ToastGravity.TOP,
    int timeInSecForIosWeb = 3,
    Color bgColor = AppColors.black,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: bgColor, // Black background
      textColor: AppColors.white, // White text
    );
  }
}
