import 'package:auto_route/auto_route.dart';
import 'package:dog_app/gen/assets.gen.dart';
import 'package:dog_app/product/constant/app_size.dart';
import 'package:dog_app/product/router/app_router.gr.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      context.router.push(const HomeRoute());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.images.imSplash.path,
          width: AppSize.screenWidth(context) * 0.15, 
          height: AppSize.screenWidth(context) * 0.15,
        ),
      ),
    );
  }
}