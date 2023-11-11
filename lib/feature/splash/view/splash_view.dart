import 'package:auto_route/auto_route.dart';
import 'package:dog_app/product/constant/app_text_style.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('sflkgklgsfkmgsfmkgfsmk',style: AppTextStyle.blackSemiBold20,),
      ),
    );
  }
}