import 'package:flutter/material.dart';
import 'package:flutter_tem/components/image/carousel_slider.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 250,
              child: CarouselSlider(),
            ),
          ],
        ),
      ),
    );
  }
}
