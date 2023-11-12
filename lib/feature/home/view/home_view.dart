import 'package:auto_route/auto_route.dart';
import 'package:dog_app/bloc/dog_breeds/dog_breeds_bloc.dart';
import 'package:dog_app/core/enum/loading_status/loading_status_enum.dart';
import 'package:dog_app/core/extension/num/num_extension.dart';
import 'package:dog_app/core/extension/widget/widget_extension.dart';
import 'package:dog_app/feature/home/view/widgets/cards/home_card.dart';
import 'package:dog_app/product/gen/assets.gen.dart';
import 'package:dog_app/product/constant/app_color.dart';
import 'package:dog_app/product/constant/app_padding.dart';
import 'package:dog_app/product/constant/app_radius.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:dog_app/product/models/dog/dog_breeds/dog_breeds_model.dart';
import 'package:dog_app/product/widgets/app_bar/custom_app_bar.dart';
import 'package:dog_app/product/widgets/button/custom_button.dart';
import 'package:dog_app/product/widgets/custom_cached_image/custom_cached_image.dart';
import 'package:dog_app/product/widgets/dialog/custom_dialog.dart';
import 'package:dog_app/product/widgets/divider/custom_divider.dart';
import 'package:dog_app/product/widgets/drag_handle/custom_drag_handle.dart';
import 'package:dog_app/product/widgets/textfield/custom_multi_line_textfield.dart';
import 'package:dog_app/product/widgets/textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              BlocBuilder<DogBreedsBloc, DogBreedsState>(
                builder: (context, state) {
                  return state.dogsBreedsList!.isEmpty
                      ? emptyBody(context)
                      : Expanded(
                          child: dogList(state),
                        );
                },
              )
            ],
          ),
          searchField(context),
        ],
      ),
    );
  }

  Padding emptyBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.screenHeight(context) * 0.2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No result found", style: AppTextStyle.blueSemiBold18),
            AppPadding.defualtPadding.height,
            Text("Try searching with another word",
                style: AppTextStyle.greyMedium16)
          ],
        ),
      ),
    );
  }

  GridView dogList(DogBreedsState state) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      itemCount: state.dogsBreedsList?.length,
      itemBuilder: (context, index) {
        final item = state.dogsBreedsList?[index];
        return HomeCard(
          title: item?.breed,
          image: item?.imageUrl,
        ).gestureDetector(onTap: () {
          dogDetailDialog(context, item);
        });
      },
    );
  }

  Future<dynamic> dogDetailDialog(BuildContext context, DogBreedsModel? item) {
    return showDialog(
        context: context,
        builder: (context) => CustomDialog(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppSize.screenWidth(context) * 0.8,
                        width: AppSize.screenWidth(context),
                        child: CustomCachedImage(
                          image: item?.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                      AppPadding.spacingPadding.height,
                      Text("Breed", style: AppTextStyle.blueSemiBold20),
                      const CustomDivider(),
                      Text(item?.breed ?? '',
                          style: AppTextStyle.blackMedium16),
                      AppPadding.spacingPadding.height,
                      Text("Sub Breeds", style: AppTextStyle.blueSemiBold20),
                      const CustomDivider(),
                      item?.subBreedsList?.isEmpty == true
                          ? Text("SubBreeds not available",
                              style: AppTextStyle.blackMedium16)
                          : ListView.builder(
                              itemCount: item!.subBreedsList!.length > 3
                                  ? 3
                                  : item.subBreedsList?.length ?? 0,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final subBreedItem = item.subBreedsList?[index];
                                return Text(
                                  subBreedItem.toString(),
                                  style: AppTextStyle.blackMedium16,
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                      const Spacer(),
                      BlocListener<DogBreedsBloc, DogBreedsState>(
                        listener: (context, state) {
                          if (state.randomDogImageUrl != null) {
                            randomImageDialog(context, state);
                          }
                        },
                        child: CustomButton(
                          title: 'Generate',
                          onTap: () {
                            context.read<DogBreedsBloc>().add(
                                DogBreedsRandomImageEvent(item?.breed ?? ''));
                          },
                        ),
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
            ));
  }

  Future<dynamic> randomImageDialog(
      BuildContext context, DogBreedsState state) {
    return showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: AppSize.screenWidth(context) * 0.7,
                width: AppSize.screenWidth(context) * 0.7,
                child: CustomCachedImage(
                    image: state.randomDogImageUrl, fit: BoxFit.fill)),
            AppPadding.defualtPadding.height,
            Container(
              padding: const EdgeInsets.all(AppPadding.spacingPadding),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.rectangle,
                  borderRadius: AppRadius.radius2),
              child: SvgPicture.asset(Assets.icons.icClose),
            ).gestureDetector(
              onTap: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  Visibility searchField(BuildContext context) {
    return Visibility(
      visible: !_isBottomSheetOpen,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            _toggleBottomSheet();
            _showSearchBottomSheet(context);
          },
          child: CustomTextfield(
            hintText: 'Search',
            isEnable: false,
            controller: TextEditingController(
              text: _searchQuery,
            ),
          ).paddingSymetric(
            horizontal: AppPadding.defualtPadding,
          ),
        ),
      ).paddingOnly(
        bottom: AppSize.screenHeight(context) * 0.03,
      ),
    );
  }

  String? _searchQuery;
  void _setSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _showSearchBottomSheet(BuildContext context) {
    context.read<DogBreedsBloc>().add(const DogBreedsSearchEvent(""));
    _setSearchQuery("");
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) =>
            NotificationListener<DraggableScrollableNotification>(
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
                    children: [
                      const CustomDragHandle(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.horizontalPadding,
                        ),
                        child: CustomMultiLineTextfield(
                          maxLines: currentSheetPosition > 0.8 ? 8 : 2,
                          hintText: 'Search',
                          onChanged: (value) {
                            context
                                .read<DogBreedsBloc>()
                                .add(DogBreedsSearchEvent(value));
                            _setSearchQuery(value);
                          },
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
