import 'package:dog_app/core/extension/num/num_extension.dart';
import 'package:dog_app/core/extension/widget/widget_extension.dart';
import 'package:dog_app/gen/assets.gen.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:dog_app/product/widgets/divider/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSettingsCard extends StatelessWidget {
  const CustomSettingsCard(
      {super.key, this.icon, this.title, this.isDivider = true, this.child});
  final String? icon;
  final String? title;
  final bool? isDivider;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon ?? '',
            ),
            AppPadding.spacingPadding.width,
            Text(
              title ?? '',
              style: AppTextStyle.blackMedium16,
            ),
            const Spacer(),
            child ?? SvgPicture.asset(Assets.icons.icSettingsArrow).paddingOnly(
                right: AppPadding.spacingPadding,
            )
          ],
        ),
        AppPadding.spacingPadding.height,
        if (isDivider!) const CustomDivider(widthValue: 1) else const SizedBox()
      ],
    ).paddingSymetric(
        vertical: AppPadding.spacingPadding,
        horizontal: AppPadding.spacingPadding,
    );
  }
}
