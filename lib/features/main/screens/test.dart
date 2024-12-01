import 'package:flutter/material.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/components/laoding/loadingcenter.dart';
import 'package:flutter_tem/features/main/widgets/image_border_filter.dart';
import 'package:flutter_tem/features/main/widgets/search_with_card.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:flutter_tem/utils/theme/app_text.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> _tabs = [];
  int _activeTabIndex = 0;
  final List<String> itemsPro =
      List.generate(12, (index) => 'Item ${index + 1}');

  @override
  void initState() {
    super.initState();
    _initializeTabs();
  }

  // Simulate API call to fetch tabs and their content
  Future<List<Map<String, dynamic>>> _fetchTabsFromApi() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    return [
      {
        'title': 'Living Room',
        'content': fetchTabContent('Living Room'),
        'filter': 'Filter for Living Room',
        'icon': const ImageBorderFilter(),
      },
      {
        'title': 'Kitchen',
        'content': fetchTabContent('Kitchen'),
        'filter': 'Filter for Kitchen',
        'icon': const ImageBorderFilter(),
      },
      {
        'title': 'Bedroom',
        'content': fetchTabContent('Bedroom'),
        'filter': 'Filter for Bedroom',
        'icon': const ImageBorderFilter(),
      },
    ];
  }

  Future<Widget> fetchTabContent(String tabName) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate content delay
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        mainAxisExtent: 106,
      ),
      padding: const EdgeInsets.all(16),
      itemCount: itemsPro.length,
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CashImage(
                  width: 36,
                  height: 36,
                  borderRadius: 18,
                  imageUrl: "https://picsum.photos/1200/1300?image=100",
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Sub-Category",
                  style: AppText.title(
                    fontSize: 12,
                    color: AppColors.black.withOpacity(0.75),
                  ),
                ),
                Text(
                  "16 Items",
                  style: AppText.title(
                    fontSize: 12,
                    color: AppColors.black.withOpacity(0.50),
                  ),
                ),
              ],
            ));
      },
    );
  }

  void _initializeTabs() async {
    List<Map<String, dynamic>> tabs = await _fetchTabsFromApi();
    setState(() {
      _tabs = tabs;
      _tabController = TabController(length: tabs.length, vsync: this);
      _tabController.addListener(_onTabChanged);
      _applyFilterForActiveTab(0); // Apply the initial filter
    });
  }

  void _onTabChanged() {
    if (_tabController.index != _activeTabIndex) {
      setState(() {
        _activeTabIndex = _tabController.index;
      });
      _applyFilterForActiveTab(_activeTabIndex);
    }
  }

  void _applyFilterForActiveTab(int activeTabIndex) {
    if (activeTabIndex < _tabs.length) {
      final filter = _tabs[activeTabIndex]['filter'] ?? 'No filter applied';
      print('Filter for active tab: $filter');
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.customGradient,
            ),
            child: const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SearchWithCard(),
              ),
            ),
          ),
          _tabs.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _tabController.length >
                          0 // Check if tabController is initialized
                      ? TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          tabAlignment: TabAlignment.start,
                          indicatorColor: AppColors.primary,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          tabs: _tabs.map((tab) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8,
                                top: 16,
                              ),
                              child: Column(
                                children: [
                                  tab['icon'] ?? const Icon(Icons.circle),
                                  const SizedBox(height: 8),
                                  Text(
                                    tab['title'],
                                    style: AppText.title(
                                      fontSize: 12,
                                      color: AppColors.black.withOpacity(0.75),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        )
                      : const SizedBox(),
                ),
          Expanded(
            child: _tabs.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : TabBarView(
                    controller: _tabController,
                    children: _tabs.asMap().entries.map((entry) {
                      final index = entry.key;
                      final tab = entry.value;
                      return index == _activeTabIndex
                          ? FutureBuilder<Widget>(
                              future: tab['content'],
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Loadingcenter();
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (snapshot.hasData) {
                                  return snapshot.data!;
                                } else {
                                  return const Center(
                                      child: Text('No data available'));
                                }
                              },
                            )
                          : const SizedBox();
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
