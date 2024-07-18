

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/base/bloc/base_bloc.dart';
import '../../infrastructure/routing/route_screen_provider.dart';

abstract class NestedRouteScreenProvider <B extends BaseBloc>
    extends RouteScreenProvider {
  late Widget child;

  Widget buildSubRoute(BuildContext context, GoRouterState state, Widget child) {
    this.child = child;
    return build(context, state);
  }
}