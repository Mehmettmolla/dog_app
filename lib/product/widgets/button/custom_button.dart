import 'package:dog_app/core/extension/widget/widget_extension.dart';
import 'package:dog_app/product/constant/app_color.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_radius.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.title,
  });
  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppPadding.horizontalPadding,
          vertical: AppPadding.verticalPadding,
        ),
        height: AppSize.screenHeight(context) * 0.062,
        decoration: BoxDecoration(
          color: AppColor.primaryBlue,
          borderRadius: AppRadius.radius8,
        ),
        child: Center(
          child: Text(
            title!,
            style: AppTextStyle.whiteSemiBold18,
            textAlign: TextAlign.center,
          ),
        )).gestureDetector(
      onTap: onTap,
    );
  }
}
