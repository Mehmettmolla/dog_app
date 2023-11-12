import 'package:dog_app/core/extension/widget/widget_extension.dart';
import 'package:dog_app/product/constant/app_color.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.widthValue = 0.8});
  final double widthValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppColor.lightGrey,
      width: AppSize.screenWidth(context) * widthValue,
    ).paddingSymetric(
      vertical: AppPadding.spacingPadding,
    );
  }
}
