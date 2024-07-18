import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:monie_point/infrastructure/routing/providers/home_route_provider.dart';
import '../../presentation/route/routes.dart';
import 'providers/splash_route_provider.dart';
import 'route_screen_provider.dart';
import 'transition_factory.dart';

@lazySingleton
class AppRouteFactory {
  final SplashRouteProvider splashRouteProvider;
  final TransitionFactory transitionFactory;
  final HomeRouteProvider homeRouteProvider;

  const AppRouteFactory({
    required this.splashRouteProvider,
    required this.transitionFactory,
    required this.homeRouteProvider,

  });

  Widget create(BuildContext context, GoRouterState state) {
    final String path = state.path ?? Routes.splash;
    final RouteScreenProvider provider;

    if (path == Routes.splash) {
      log("Path is  Splash");
      provider = splashRouteProvider;
    }else if (path == Routes.home) {
      log("Path is Home ");
      provider = homeRouteProvider;
    }else {
      log("Invalid Rout");
      throw "invalid route, please prepare NOT FOUND page for this state";
    }
    return provider.buildRoute(context, state);
  }


  Page createPage(BuildContext context, GoRouterState state) {
    return transitionFactory.create(create(context, state), state);
  }

}
