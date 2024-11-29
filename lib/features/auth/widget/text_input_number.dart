import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tem/utils/theme/app_text.dart';
import '../../../utils/theme/app_colors.dart';

class TextInputNumber extends StatelessWidget {
  final String hintText;
  final int? numberText;
  const TextInputNumber({
    super.key,
    required this.hintText,
    this.numberText = 10,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.grey),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: InputBorder.none,
      ),
      style: AppText.title(color: AppColors.white),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter
            .digitsOnly, // Restricts input to digits only
        LengthLimitingTextInputFormatter(
            numberText), // Optional: limits input to 10 characters
      ],
    );
  }
}
