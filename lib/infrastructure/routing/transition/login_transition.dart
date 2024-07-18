import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'page_transition.dart';

@injectable
class LoginTransition implements PageTransition {
  @override
  Page create(Widget screen, GoRouterState routerState) {
    return CustomTransitionPage(
      child: screen,
      transitionDuration: const Duration(milliseconds: 1200),
      reverseTransitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.8),
            end: Offset.zero,
          ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInQuint)),
          child: child, // child is the value returned by pageBuilder
        );
      },
    );
  }
}
