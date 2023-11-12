import 'package:dog_app/core/extension/widget/widget_extension.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_radius.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:dog_app/product/widgets/custom_cached_image/custom_cached_image.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String? image;
  final String? title;
  const HomeCard({super.key, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(AppPadding.defualtPadding),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            height: AppSize.screenHeight(context) * 0.25,
            width: AppSize.screenWidth(context) * 0.5,
            child: ClipRRect(
              borderRadius: AppRadius.radius8,
              child: CustomCachedImage(
                image: image,
                fit: BoxFit.cover,
              )
            ),
          ),
          Text(title ?? '', style: AppTextStyle.whiteMedium16,).paddingSymetric(
         horizontal: AppPadding.spacingPadding,
          vertical: AppPadding.spacingPadding,
          ),
        ],
      ),
    );
  }
}

//  Container(
//       margin: const EdgeInsets.all(AppPadding.defualtPadding),
//       child: Stack(
//         alignment: Alignment.bottomLeft,
//         children: [
//           CustomCachedImage(
//             url: image,
//             fit: BoxFit.cover,
//           ),
//           Text(title ?? '', style: AppTextStyle.whiteMedium16,).paddingSymetric(
//          horizontal: AppPadding.spacingPadding,
//           vertical: AppPadding.spacingPadding,
//           ),
//         ],
//       ),
//     );