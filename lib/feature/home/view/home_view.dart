import 'package:auto_route/auto_route.dart';
import 'package:dog_app/core/extension/num/num_extension.dart';
import 'package:dog_app/core/extension/widget/widget_extension.dart';
import 'package:dog_app/feature/home/view/widgets/cards/home_card.dart';
import 'package:dog_app/gen/assets.gen.dart';
import 'package:dog_app/product/constant/app_color.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_radius.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:dog_app/product/widgets/app_bar/custom_app_bar.dart';
import 'package:dog_app/product/widgets/button/custom_button.dart';
import 'package:dog_app/product/widgets/dialog/custom_dialog.dart';
import 'package:dog_app/product/widgets/divider/custom_divider.dart';
import 'package:dog_app/product/widgets/drag_handle/custom_drag_handle.dart';
import 'package:dog_app/product/widgets/textfield/custom_multi_line_textfield.dart';
import 'package:dog_app/product/widgets/textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool _isBottomSheetOpen = false;

  void _toggleBottomSheet() {
    setState(() {
      _isBottomSheetOpen = !_isBottomSheetOpen;
    });
  }
    double currentSheetPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: '\$appName',
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const HomeCard(
                      title: 'Title',
                    ).gestureDetector(
                      onTap: () => showDialog(context: context, builder: (context) => CustomDialog(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Image.asset(Assets.images.imSplash.path, width: AppSize.screenWidth(context), height: AppSize.screenWidth(context) * 0.8, fit: BoxFit.fill,),
                                AppPadding.spacingPadding.height,
                                Text('Title', style:AppTextStyle.blueSemiBold20),
                                const CustomDivider(),
                                Text("title2", style: AppTextStyle.blackMedium16),
                                AppPadding.spacingPadding.height,
                                Text('Title', style:AppTextStyle.blueSemiBold20),
                                const CustomDivider(),
                                Text("title3", style: AppTextStyle.blackMedium16),
                                AppPadding.spacingPadding.height,
                                Text("title3", style: AppTextStyle.blackMedium16),
                                const Spacer(),
                                CustomButton(
                                  title: 'Generate',
                                  onTap: () {
                                     showDialog(context: context, builder: (context) {
                                      return  Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(Assets.images.imSplash.path, width: AppSize.screenWidth(context) * 0.7, height: AppSize.screenWidth(context) * 0.7, fit: BoxFit.fill,),
                                          AppPadding.defualtPadding.height,
                                         Container(
                                          padding: const EdgeInsets.all(AppPadding.spacingPadding),
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: AppRadius.radius2
                                          ),
                                          child: SvgPicture.asset(Assets.icons.icClose),
                                         ).gestureDetector(
                                            onTap: () => Navigator.pop(context),
                                          )
                                        ],
                                      );
                                    },);
                                  },
                                )
                              ],
                            ),
                             Align(
                              alignment: Alignment.topRight,
                               child: Container(
                                            padding: const EdgeInsets.all(AppPadding.spacingPadding),
                                            margin: const EdgeInsets.all(AppPadding.spacingPadding),
                                            decoration: const BoxDecoration(
                                              color: AppColor.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: SvgPicture.asset(Assets.icons.icClose),
                                           ).gestureDetector(
                                              onTap: () => Navigator.pop(context),
                                            ),
                             )
                          ],
                        ),
                      ))
                    );
                  },
                ),
              )
            ],
          ),
           Visibility(
              visible: !_isBottomSheetOpen,
             child: Align(
                alignment: Alignment.bottomCenter,
               child: GestureDetector(
                onTap: () {
                  _toggleBottomSheet();
                  _showSearchBottomSheet(context);
                } ,
                 child: const CustomTextfield(
                      hintText: 'Search',
                      isEnable: false,
                    ).paddingSymetric(
                      horizontal: AppPadding.defualtPadding,
                    ),
               ),
             ).paddingOnly(
              bottom: AppSize.screenHeight(context) * 0.03,
             ),
           ),
        ],
      ),
    );
  }


  void _showSearchBottomSheet(BuildContext context) {
    
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, 
    barrierColor: Colors.transparent,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) =>  NotificationListener< DraggableScrollableNotification>(
         onNotification: (notification) {
        setState(() {
          currentSheetPosition = notification.extent;
        });
        return true;
      },
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.89, 
          minChildSize: 0.5, 
          expand: false,
          builder: (_, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white, 
                border: Border.fromBorderSide(
                  BorderSide(
                    color: AppColor.lightGrey, 
                    width: 1,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children:  [
                    const CustomDragHandle(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontalPadding,
                      ),
                      child: CustomMultiLineTextfield(
                        maxLines: currentSheetPosition > 0.8 ? 8 : 2,
                        hintText: 'Search',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  ).whenComplete(() => {
    setState(() {
      _isBottomSheetOpen = false;
    }),
  });
}
}

