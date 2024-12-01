import 'package:flutter/material.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';

class ImageWithBorder extends StatelessWidget {
  const ImageWithBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          19,
        ),
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        ),
      ),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            17,
          ),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: const CashImage(
          width: 32,
          height: 32,
          borderRadius: 16,
          imageUrl: "https://picsum.photos/1200/1300?image=1",
        ),
      ),
    );
  }
}
