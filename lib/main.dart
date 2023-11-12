import 'package:dog_app/bloc/dog_breeds/dog_breeds_bloc.dart';
import 'package:dog_app/product/gen/fonts.gen.dart';
import 'package:dog_app/product/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogBreedsBloc>(
      create: (context) =>  DogBreedsBloc(),
      child: MaterialApp.router(
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: FontFamily.galanoGrotesque,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          )),
    );
  }
}
