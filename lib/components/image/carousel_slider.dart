import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tem/components/image/cash_image.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final List<Map<String, String>> carouselItems = [
    {'title': 'Item 1', 'text': 'Text 1'},
    {'title': 'Item 2', 'text': 'Text 2'},
    {'title': 'Item 3', 'text': 'Text 3'},
  ];

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_currentIndex == carouselItems.length - 1) {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: carouselItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Center(
                child: CashImage(
                    borderRadius: 16,
                    width: MediaQuery.of(context).size.width - 16,
                    height: 250,
                    fit: BoxFit.cover,
                    imageUrl: 'https://picsum.photos/2080/2080?random=$index'),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(carouselItems.length, (index) {
                double scale = _currentIndex == index ? 1.4 : 0.8;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  transform: Matrix4.identity()..scale(scale),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
