import 'package:dog_app/feature/home/view_model/home_view_model.dart';
import 'package:dog_app/feature/splash/view/splash_view.dart';
import 'package:dog_app/feature/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashViewModel>(
          create: (context) => SplashViewModel(),
        ),
        BlocProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView()
      ),
    );
  }
}
