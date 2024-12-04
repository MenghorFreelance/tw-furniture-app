import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tem/utils/image/app_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:flutter_tem/utils/theme/app_text.dart';

class SearchWithCard extends StatelessWidget {
  final GestureTapCallback onTap;
  const SearchWithCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImage.search,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Looking for chairs, tables, or sofas?",
                    style: AppText.title(
                      fontSize: 12,
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(
                AppImage.order,
              ),
            ),
            Positioned(
              top: -8,
              right: -8,
              child: Container(
                alignment: Alignment.center,
                height: 16,
                constraints: const BoxConstraints(
                  minWidth: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "1",
                  style: AppText.title(
                    fontSize: 10,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
