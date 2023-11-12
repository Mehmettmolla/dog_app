import 'package:dog_app/product/constant/app_color.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_radius.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
       insetPadding:
             const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding),
        child: Container(
          width: AppSize.screenWidth(context),
          height: AppSize.screenHeight(context) * 0.7,
          decoration: BoxDecoration(
            borderRadius: AppRadius.radius12,
            color: AppColor.white,
          ),
          child: child,
        ),
      ),
    );
  }
}