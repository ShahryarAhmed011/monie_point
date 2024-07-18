import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/base/bloc/base_bloc.dart';

abstract class RouteScreenProvider<B extends BaseBloc> {
  const RouteScreenProvider();

  Widget buildRoute(BuildContext context, GoRouterState state) {
    return build(context, state);
  }

  @protected
  Widget build(BuildContext context, GoRouterState state);
}
