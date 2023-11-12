// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:dog_app/feature/base_scaffold/view/base_scaffold_view.dart'
    as _i4;
import 'package:dog_app/feature/home/view/home_view.dart' as _i2;
import 'package:dog_app/feature/splash/view/splash_view.dart' as _i3;
import 'package:dog_app/product/router/app_router.dart' as _i1;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    EmptyRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashView(),
      );
    },
    BaseScaffoldRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BaseScaffoldView(),
      );
    },
  };
}

/// generated route for
/// [_i1.EmptyView]
class EmptyRoute extends _i5.PageRouteInfo<void> {
  const EmptyRoute({List<_i5.PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashView]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BaseScaffoldView]
class BaseScaffoldRoute extends _i5.PageRouteInfo<void> {
  const BaseScaffoldRoute({List<_i5.PageRouteInfo>? children})
      : super(
          BaseScaffoldRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseScaffoldRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
