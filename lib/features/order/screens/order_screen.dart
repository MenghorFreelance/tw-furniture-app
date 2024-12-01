import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tem/components/app_bar/app_bar.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/components/modal/show_modal_contact.dart';
import 'package:flutter_tem/utils/image/app_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:flutter_tem/utils/theme/app_text.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String selectedFilter = "All Orders";
  List<String> filterOptions = [
    'All Orders',
    'Progress',
    'History',
  ];
  final List<String> imageUrls = [
    'https://via.placeholder.com/150?text=Image+1',
    'https://via.placeholder.com/150?text=Image+2',
    'https://via.placeholder.com/150?text=Image+3',
    'https://via.placeholder.com/150?text=Image+4',
    'https://via.placeholder.com/150?text=Image+5',
    'https://via.placeholder.com/150?text=Image+6',
  ];

  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarMain(
            child: Row(
              children: [
                Text(
                  "My Orders",
                  style: AppText.title(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => showCustomBottomModal(context),
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImage.support),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Support",
                          style: AppText.title(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 36, // Set height for the horizontal scroll
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scroll
                itemCount: filterOptions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filterOptions[index];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: selectedFilter == filterOptions[index]
                            ? Colors.black
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: selectedFilter == filterOptions[index]
                              ? Colors.transparent
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          filterOptions[index],
                          style: AppText.title(
                            fontSize: 16,
                            color: selectedFilter == filterOptions[index]
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length, // Length of the list
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    32,
                                  ),
                                  color: AppColors.primary,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Order #2 | 150.00",
                                            style: AppText.title(
                                              fontSize: 12,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "Delivered & Setup",
                                            style: AppText.title(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "11-Nov-2024 | 3 Items | Cash",
                                        style: AppText.title(
                                          fontSize: 12,
                                          color: AppColors.black.withOpacity(
                                            0.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              ...imageUrls.take(4).map((imageUrl) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: CashImage(
                                    width: 36,
                                    height: 36,
                                    imageUrl: imageUrl,
                                  ),
                                );
                              }),
                              if (imageUrls.length > 4)
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 36, // Adjust the size as needed
                                    height: 36,
                                    child: Text(
                                      '+${imageUrls.length - 4}',
                                      style: AppText.title(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              const Spacer(),
                              Container(
                                height: 36,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "Re-order",
                                  style: AppText.title(
                                    fontSize: 12,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
