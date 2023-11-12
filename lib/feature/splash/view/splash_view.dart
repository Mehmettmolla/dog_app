import 'package:auto_route/auto_route.dart';
import 'package:dog_app/bloc/dog_breeds/dog_breeds_bloc.dart';
import 'package:dog_app/gen/assets.gen.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:dog_app/product/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DogBreedsBloc>().add(DogBreedsEventInit());
    });
    super.initState();
  }

  Future<void> preloadImages(List<String> imageUrls) async {
    await Future.wait(
        imageUrls.map((url) => precacheImage(NetworkImage(url), context)));
  }

  void _onStateChange(DogBreedsState state) {
    if (state is DogBreedsLoaded ) {
      preloadImages(state.dogsBreedsList!.map((e) => e.imageUrl!).toList())
          .then((_) {
        context.router.push(const HomeRoute());
      }).catchError((error) {
        context.router.push(const HomeRoute());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DogBreedsBloc, DogBreedsState>(
      listener: (context, state) {
        _onStateChange(state);
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            Assets.images.imSplash.path,
            width: AppSize.screenWidth(context) * 0.15,
            height: AppSize.screenWidth(context) * 0.15,
          ),
        ),
      ),
    );
  }
}
