import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';

class ImageCarouselSlider extends StatefulWidget {
  const ImageCarouselSlider({super.key});

  @override
  State<ImageCarouselSlider> createState() => _ImageCarouselSliderState();
}

class _ImageCarouselSliderState extends State<ImageCarouselSlider> {
  final List<String> _images = [
    'https://picsum.photos/1200/1300?image=11',
    'https://picsum.photos/1200/1300?image=21',
    'https://picsum.photos/1200/1300?image=31',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          itemCount: _images.length,
          itemBuilder: (context, index, realIndex) {
            return CashImage(
              width: double.infinity,
              imageUrl: _images[index],
            );
          },
          options: CarouselOptions(
            height: 203,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        // Pagination Dots
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _images.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 4,
                width: _currentIndex == index ? 16 : 12,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index ? AppColors.primary : Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
