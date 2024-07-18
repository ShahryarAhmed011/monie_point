import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/route/routes.dart';
import 'transition/default_transition.dart';
import 'transition/login_transition.dart';
import 'transition/page_transition.dart';

@injectable
class TransitionFactory {
  final LoginTransition loginTransition;
  final DefaultTransition defaultTransition;

  const TransitionFactory(
      {required this.loginTransition, required this.defaultTransition});

  Page create(Widget screen, GoRouterState state) {
    final String path = state.path ?? Routes.splash;
    PageTransition pageTransition;
    pageTransition = defaultTransition;
    return pageTransition.create(screen, state);
  }
}
