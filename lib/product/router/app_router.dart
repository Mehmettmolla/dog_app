import 'package:auto_route/auto_route.dart';
import 'package:dog_app/product/router/app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {      
   
 @override      
 List<AutoRoute> get routes => [      
  AutoRoute(page: SplashRoute.page, initial: true),
  AutoRoute(page: HomeRoute.page),
  ];    
}    