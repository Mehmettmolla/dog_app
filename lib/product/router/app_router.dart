import 'package:auto_route/auto_route.dart';
import 'package:dog_app/product/router/app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {      
   
 @override      
 List<AutoRoute> get routes => [      
  AutoRoute(page: SplashRoute.page, initial: true),
  AutoRoute(page: BaseScaffoldRoute.page, children: [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: EmptyRoute.page),
  ]),
  ];    
}    

@RoutePage()
class EmptyView extends AutoRouter {
  const EmptyView({super.key});
}
