import 'package:dog_app/product/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, this.image, this.fit});
  final String? image;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image!,
      fit: fit ?? BoxFit.cover,
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
