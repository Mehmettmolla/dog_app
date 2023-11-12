import 'package:dog_app/product/constant/app_color.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_radius.dart';
import 'package:flutter/material.dart';


class CustomDragHandle extends StatelessWidget {
  const CustomDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 4.0,
      margin: const EdgeInsets.symmetric(vertical: AppPadding.spacingPadding),
      decoration:
          BoxDecoration(color: AppColor.lightGrey, borderRadius: AppRadius.radius12),
    );
  }
}
