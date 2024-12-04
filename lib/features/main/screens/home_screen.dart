import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_tem/components/image/carousel_slider.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/features/main/widgets/image_with_border.dart';
import 'package:flutter_tem/features/main/widgets/search_with_card.dart';
import 'package:flutter_tem/utils/image/app_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:flutter_tem/utils/theme/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final List<String> items = List.generate(6, (index) => 'Item ${index + 1}');
  final List<String> itemsPro =
      List.generate(12, (index) => 'Item ${index + 1}');
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: AppColors.customGradient, // Use the custom gradient
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchWithCard(
                        onTap: () {
                          print("Hell");
                          context.push('/search');
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const ImageCarouselSlider(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Category",
                    style: AppText.title(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "What are you looking for?",
                    style: AppText.title(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      crossAxisSpacing: 8.0, // Horizontal space between items
                      mainAxisSpacing: 8.0,
                      mainAxisExtent: 91,
                    ),
                    shrinkWrap: true, // Shrinks the grid to fit its content
                    padding: EdgeInsets.zero, // No padding around the grid
                    physics:
                        const NeverScrollableScrollPhysics(), // Disables scrolling
                    itemCount: items.length, // Total number of items
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => context.push("/product-list"),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ImageWithBorder(),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Living Room",
                                style: AppText.title(
                                  fontSize: 12,
                                  color: AppColors.black.withOpacity(
                                    0.75,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Event / Promotion",
                    style: AppText.title(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Duration: 10 Oct - 31 Nov 2024",
                    style: AppText.title(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of items per row
                      crossAxisSpacing: 16.0, // Horizontal space between items
                      mainAxisSpacing: 16.0,
                      mainAxisExtent: 163,
                    ),
                    shrinkWrap: true, // Shrinks the grid to fit its content
                    padding: EdgeInsets.zero, // No padding around the grid
                    physics:
                        const NeverScrollableScrollPhysics(), // Disables scrolling
                    itemCount: items.length, // Total number of items
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.black
                                .withOpacity(0.15), // Border color
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CashImage(
                                width: double.infinity,
                                height: 96,
                                borderRadius: 4,
                                imageUrl:
                                    "https://picsum.photos/1200/1300?image=1",
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              width: double.infinity,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.red,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImage.discount),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "50%",
                                    style: AppText.title(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "Only 5 left",
                              style: AppText.title(
                                fontSize: 12,
                                color: AppColors.black.withOpacity(
                                  0.5,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () => context.push("/product-list"),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.body,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text("View all"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Newest Products",
                      style: AppText.title(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.push("/product-list"),
                      child: Text(
                        "View All",
                        style: AppText.title(
                          fontSize: 12,
                          color: AppColors.primary,
                          underline: true,
                          underlineColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing: 8.0, // Horizontal space between items
                  mainAxisSpacing: 8.0,
                  mainAxisExtent: 242,
                ),
                shrinkWrap: true, // Shrinks the grid to fit its content
                padding: EdgeInsets.zero, // No padding around the grid
                physics:
                    const NeverScrollableScrollPhysics(), // Disables scrolling
                itemCount: itemsPro.length, // Total number of items
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              const CashImage(
                                width: double.infinity,
                                height: 161,
                                imageUrl:
                                    "https://picsum.photos/1200/1300?image=1",
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.favorite,
                                    size: 18,
                                    color: AppColors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Product Name",
                            style: AppText.title(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "1 Unit / \$50.00",
                            style: AppText.title(
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Only 5 left",
                                style: AppText.title(
                                  fontSize: 12,
                                  color: AppColors.black.withOpacity(0.5),
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
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
