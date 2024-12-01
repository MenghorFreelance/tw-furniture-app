import 'package:flutter/material.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';

class ImageBorderFilter extends StatelessWidget {
  const ImageBorderFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          24,
        ),
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        ),
      ),
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            23,
          ),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: const CashImage(
          width: 44,
          height: 44,
          borderRadius: 22,
          imageUrl: "https://picsum.photos/1200/1300?image=1",
        ),
      ),
    );
  }
}
