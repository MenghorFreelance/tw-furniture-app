import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<String> _images = [
    'https://picsum.photos/1200/1300?image=1', // Replace with actual URLs
    'https://picsum.photos/1200/1300?image=2',
    'https://picsum.photos/1200/1300?image=3',
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < _images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Image Carousel
        SizedBox(
          height: 203,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return CashImage(
                imageUrl: _images[index],
              );
            },
          ),
        ),
        // Pagination Dots
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_images.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 4,
                width: _currentIndex == index ? 16 : 12,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index ? AppColors.primary : Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
