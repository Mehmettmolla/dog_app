import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, this.image, this.fit});
  final String? image;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image!,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Center(
            child: Image.asset(
          Assets.images.imNoImage.path,
          fit: BoxFit.cover,
        ));
      },
    );
  }
}
