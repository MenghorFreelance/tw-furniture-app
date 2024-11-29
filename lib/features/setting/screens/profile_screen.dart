import 'package:flutter/material.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:flutter_tem/utils/theme/app_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(5, (index) => 'Item ${index + 1}');
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.customGradient, // Use the custom gradient
            ),
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style: AppText.title(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          4.0,
                        ), // Apply border radius to the container
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CashImage(
                              width: 32,
                              height: 32,
                              borderRadius: 16,
                              imageUrl: "https://picsum.photos/400/400",
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello",
                                    style: AppText.title(
                                        fontSize: 12,
                                        color:
                                            AppColors.black.withOpacity(0.5)),
                                  ),
                                  Text(
                                    "Tiffanny Store",
                                    style: AppText.title(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.edit,
                              size: 24,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 96,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(
                                4.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  size: 24,
                                  color: AppColors.orange,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "My Favorite",
                                  style: AppText.title(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            height: 96,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(
                                4.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_city,
                                  size: 24,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Delivery Address",
                                  style: AppText.title(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient:
                            AppColors.customGradient, // Use the custom gradient
                        borderRadius: BorderRadius.circular(
                          4.0,
                        ), // Apply border radius to the container
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const CashImage(
                                    width: 32,
                                    height: 32,
                                    borderRadius: 16,
                                    imageUrl: "https://picsum.photos/400/400",
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Tiffanny Store",
                                    style: AppText.title(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: AppColors.white,
                                      underline: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.fillPrimary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        children: [
                          ...items.map(
                            (item) {
                              return InkWell(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const CashImage(
                                                  width: 24,
                                                  height: 24,
                                                  borderRadius: 4,
                                                  imageUrl:
                                                      "https://picsum.photos/400/400",
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Tiffanny Store",
                                                  style: AppText.title(
                                                    fontSize: 12,
                                                    underline: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 20,
                                            color:
                                                Colors.black.withOpacity(0.25),
                                          )
                                        ],
                                      ),
                                    ),
                                    if (items.indexOf(item) != items.length - 1)
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Divider(
                                          color: AppColors.lineGrey,
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
