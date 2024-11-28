import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CashImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  const CashImage({
    super.key,
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 8.0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Container(
          key: const ValueKey('placeholder'),
          width: width,
          height: height,
          color: Colors.blueGrey,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          key: const ValueKey('error'),
          width: width,
          height: height,
          color: Colors.blueGrey,
          child: Icon(
            Icons.broken_image,
            size: width * 0.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
