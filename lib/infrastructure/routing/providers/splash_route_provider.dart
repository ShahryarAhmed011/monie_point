import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../../presentation/modules/splash/bloc/splash_bloc.dart';
import '../../../presentation/modules/splash/splash_screen.dart';
import '../route_screen_provider.dart';

@injectable
class SplashRouteProvider extends RouteScreenProvider<SplashBloc> {
  const SplashRouteProvider();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: const SplashScreen(),
    );
  }
}
