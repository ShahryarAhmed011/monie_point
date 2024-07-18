import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'page_transition.dart';

@injectable
class DefaultTransition implements PageTransition {
  @override
  Page create(Widget screen, GoRouterState routerState) {
    return CustomTransitionPage(
      child: screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
