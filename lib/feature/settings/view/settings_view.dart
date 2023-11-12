import 'dart:io';

import 'package:dog_app/gen/assets.gen.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:dog_app/product/models/settings/settings_model.dart';
import 'package:dog_app/product/widgets/card/custom_settings_card.dart';
import 'package:dog_app/product/widgets/drag_handle/custom_drag_handle.dart';
import 'package:flutter/material.dart';

@immutable
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  
  static List<SettingsModel> settingsTab = [
    SettingsModel(
      icon: Assets.icons.icSettingsHelp,
      title: 'Help',
    ),
    SettingsModel(
      icon: Assets.icons.icSettingsRate,
      title: 'Rate Us',
    ),
    SettingsModel(
      icon: Assets.icons.icSettingsShare,
      title: 'Share with Firends',
    ),
    SettingsModel(
      icon: Assets.icons.icSettingsTerm,
      title: 'Terms of Use',
    ),
    SettingsModel(
      icon: Assets.icons.icSettingsPrivacy,
      title: 'Privacy Policy',
    ),
    SettingsModel(
        icon: Assets.icons.icSettingsVersion,
        title: Platform.isAndroid ? 'Android Version' : 'IOS Version',
        isDivider: false,
        child: Text(
          Platform.operatingSystemVersion,
          maxLines: 1,
          style: AppTextStyle.blackMedium16,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const CustomDragHandle(),
          SizedBox(
            height: AppSize.screenHeight(context) * 0.07,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: settingsTab.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.only(left: AppPadding.horizontalPadding),
              itemBuilder: (context, index) {
                final item = settingsTab[index];
                return CustomSettingsCard(
                  title: item.title,
                  icon: item.icon,
                  isDivider: item.isDivider,
                  child: item.child,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
