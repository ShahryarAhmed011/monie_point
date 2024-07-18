import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../presentation/route/routes.dart';
import 'route_factory.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@lazySingleton
class AppRouter {
  final AppRouteFactory routeFactory;
  GoRouter? _goRouter;

  AppRouter({required this.routeFactory});

  GoRouter generateRoutes() {
    log("GoRouterCalled");
    final GoRouter goRouter;
    if (_goRouter == null) {
      goRouter = GoRouter(
        debugLogDiagnostics: true,
        navigatorKey: _rootNavigatorKey,
        routes: <RouteBase>[
          GoRoute(
              path: Routes.splash,
              builder: (context, state) => routeFactory.create(context, state)),
          GoRoute(
              path: Routes.home,
              builder: (context, state) => routeFactory.create(context, state)),
        ],
      );
      _goRouter = goRouter;
    } else {
      goRouter = _goRouter!;
    }

    return goRouter;
  }

}
