import 'package:dog_app/product/constant/app_color.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  @override
  final Size preferredSize;
  const CustomAppBar({super.key, this.title})
      : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? '', style: AppTextStyle.blackSemiBold20,),
      backgroundColor: AppColor.white,
      centerTitle: true,
      elevation: 0.0,
    );
  }
}
