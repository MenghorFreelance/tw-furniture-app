import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tem/components/app_bar/app_bar.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/utils/image/app_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:flutter_tem/utils/theme/app_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> items =
      List<String>.generate(20, (index) => 'Item ${index + 1}');
  final List<String> itemsPro =
      List.generate(12, (index) => 'Item ${index + 1}');
  bool _onSearch = false;
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void clearText() {
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarMain(
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color:
                        AppColors.primary, // Set your desired background color
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(4), // Optional rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // This centers the children in the Row
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(),
                            child: SvgPicture.asset(
                              AppImage.search,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              style: AppText.title(
                                fontSize: 12,
                              ),
                              onChanged: (text) {
                                setState(() {});
                                // Call a function to filter the list based on the input
                                print("HEE" + text);
                              },
                              onSubmitted: (text) {
                                setState(() {
                                  _onSearch = true;
                                });
                                // Trigger filter or close keyboard when user presses "done"
                                print("HEEtext" + text);
                              },
                              maxLines: 1,
                              cursorHeight: 16,
                              decoration: InputDecoration(
                                isCollapsed: true, // Ensures tighter layout
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 8,
                                ), // Adjust padding as needed
                                hintText:
                                    'Looking for chairs, tables, or sofas?',
                                hintStyle: AppText.title(
                                  fontSize: 12,
                                  color: AppColors.black.withOpacity(0.5),
                                ),
                                border: InputBorder
                                    .none, // No border for the text field
                              ),
                            ),
                          ),
                          if (_controller.text.length > 1)
                            InkWell(
                              onTap: clearText,
                              child: const Icon(
                                Icons.close,
                                size: 20,
                              ),
                            ),
                          const SizedBox(
                            width: 4,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.clear();
                      _onSearch = false;
                      FocusScope.of(context).unfocus();
                    });
                  },
                  child: Text(
                    "Cancel",
                    style:
                        AppText.title(color: AppColors.white, underline: true),
                  ),
                )
              ],
            ),
          ),
          _onSearch
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        color: AppColors.white,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Search Name",
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Results Found: 6 items",
                              style: AppText.title(
                                fontSize: 12,
                                color: AppColors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            mainAxisExtent: 323,
                          ),
                          padding: const EdgeInsets.all(16),
                          itemCount: itemsPro.length,
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
                                          height: 242,
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
                                              borderRadius:
                                                  BorderRadius.circular(4),
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
                                            borderRadius:
                                                BorderRadius.circular(6),
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
                                            borderRadius:
                                                BorderRadius.circular(6),
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
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "Only 5 left",
                                          style: AppText.title(
                                            fontSize: 12,
                                            color: AppColors.black
                                                .withOpacity(0.5),
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
                    ],
                  ),
                )
              : Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo is ScrollUpdateNotification ||
                          scrollInfo is ScrollEndNotification) {
                        FocusScope.of(context).unfocus();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => print("Puh"),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  child: Row(
                                    children: [
                                      const CashImage(
                                        width: 36,
                                        height: 36,
                                        borderRadius: 18,
                                        imageUrl: "",
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Text(
                                          "Product Name",
                                          style: AppText.title(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Divider(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
