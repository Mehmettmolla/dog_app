
import 'package:dog_app/product/constant/app_color.dart';
import 'package:dog_app/product/constant/app_radius.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
const CustomTextfield({super.key, this.hintText, this.isEnable = true});
  final String? hintText;
  final bool? isEnable;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.radius8,
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.16),
            blurRadius: 16,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          )
        ]
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: AppColor.white,
          enabled: isEnable!,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: AppRadius.radius8,
            borderSide: BorderSide.none
          ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.radius8,
              borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppRadius.radius8,
              borderSide: BorderSide.none
            ),
          hintText: hintText ?? '',
          hintStyle: AppTextStyle.greyMedium16
        ),
      ),
    );
  }
}