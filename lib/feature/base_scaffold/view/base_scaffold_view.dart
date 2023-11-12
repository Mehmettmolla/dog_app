import 'package:auto_route/auto_route.dart';
import 'package:dog_app/core/extension/widget/widget_extension.dart';
import 'package:dog_app/feature/settings/view/settings_view.dart';
import 'package:dog_app/product/gen/assets.gen.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:dog_app/product/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class BaseScaffoldView extends StatefulWidget {
  const BaseScaffoldView({super.key});

  @override
  State<BaseScaffoldView> createState() => _BaseScaffoldViewState();
}

class _BaseScaffoldViewState extends State<BaseScaffoldView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      animatePageTransition: false,
      routes: const [HomeRoute(), EmptyRoute()],
      builder: (context, child, tabController) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: child,
          bottomNavigationBar: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.images.imBottomBar.path),
                    fit: BoxFit.fill,
                  ),
                ),
                child: bottomNavigationBar(tabController, context),
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBar bottomNavigationBar(
      TabController tabController, BuildContext context) {
    return BottomNavigationBar(
        selectedLabelStyle: AppTextStyle.blueSemiBold11,
        unselectedLabelStyle: AppTextStyle.blackSemiBold11,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: tabController.index,
        onTap: (index) => {
              if (index == 1)
                {_showSettings(context)}
              else
                {
                  context.tabsRouter.setActiveIndex(index),
                }
            },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.icHome)
                  .paddingOnly(top: AppPadding.defualtPadding),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.icSettings)
                .paddingOnly(top: AppPadding.defualtPadding),
            label: 'Settings',
          ),
        ]);
  }

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        builder: (context) => const SettingsView());
  }
}
