

import 'package:dog_app/gen/assets.gen.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_radius.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String? image;
  final String? title;
  const HomeCard({super.key, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.all(AppPadding.defualtPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.spacingPadding,
        vertical: AppPadding.spacingPadding,
      ),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: AppRadius.radius8,
        image: DecorationImage(
          image: AssetImage(Assets.images.imSplash.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(title ?? '', style: AppTextStyle.whiteMedium16,),
    );
  }
}