import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class PageTransition {
  Page create(Widget screen,GoRouterState routerState);
}