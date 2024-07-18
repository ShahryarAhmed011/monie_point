import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/base_bloc.dart';
import '../state/listenable_state.dart';
import '../state/navigate_state.dart';
import '../state/pop_state.dart';
import '../state/replace_state.dart';
import 'screen_mixin.dart';

abstract class StatefulScreen<B extends BaseBloc> extends StatefulWidget {

  const StatefulScreen({Key? key}) : super(key: key);
}

abstract class ScreenState<B extends BaseBloc> extends State<StatefulScreen<B>>
    with ScreenMixin {

  late B bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<B>();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => BlocListener(
        bloc: context.read<B>(),
        listenWhen: _listenCondition,
        listener: (context, state) {
          _handleState(context, state);
        },
        child: buildScreen(context),
      ),
    );
  }

  Widget buildScreen(BuildContext context);

  bool _listenCondition(Object? previous, Object? current) {
    return current is ListenableState;
  }

  void onListenableState(BuildContext context, Object? state) async {}

  void _navigateToRoute(
      BuildContext context, B bloc, NavigateState state) async {
    Object? result = await _navigate(context, state);
    bloc.onNavigationResult(result);
  }

  void _replaceRoute(BuildContext context, ReplaceState state) {
    log("Rout _replaceRoute ${state.path}");
    _replace(context, state);
  }

  void _replace(BuildContext context, ReplaceState state) {
    log("Rout _replace ${state.path}");
    context.go(
        Uri(path: state.path, queryParameters: state.queryParams, ).toString(),
        extra: state.extra);
  }

  Future<dynamic> _navigate<T extends Object?>(
      BuildContext context, NavigateState state) async {
    log("Rout _navigate ${state.path}");
    return context.push(
        Uri(path: state.path, queryParameters: state.queryParams).toString(),
        extra: state.extra);
  }

  void _pop(BuildContext context, Object? extra) {
    if (context.canPop()) {
      if (extra == null) {
        context.pop();
      } else {
        context.pop(extra);
      }
    }
  }

  void _handleState(BuildContext context, Object? state) {
    if (state is NavigateState) {
      _navigateToRoute(context, context.read<B>(), state);
      return;
    }

    if (state is ReplaceState) {
      _replaceRoute(context, state);
      return;
    }

    if (state is PopState) {
      _pop(context, state.extra);
      return;
    }

    onListenableState(context, state);
  }
}

abstract class AliveScreenState<B extends BaseBloc> extends State<StatefulScreen<B>>
    with ScreenMixin ,AutomaticKeepAliveClientMixin{

  late B bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<B>();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Builder(
      builder: (context) => BlocListener(
        bloc: context.read<B>(),
        listenWhen: _listenCondition,
        listener: (context, state) {
          _handleState(context, state);
        },
        child: buildScreen(context),
      ),
    );
  }

  Widget buildScreen(BuildContext context);

  bool _listenCondition(Object? previous, Object? current) {
    return current is ListenableState;
  }

  void onListenableState(BuildContext context, Object? state) async {}

  void _navigateToRoute(
      BuildContext context, B bloc, NavigateState state) async {
    Object? result = await _navigate(context, state);
    bloc.onNavigationResult(result);
  }

  void _replaceRoute(BuildContext context, ReplaceState state) {
    _replace(context, state);
  }

  void _replace(BuildContext context, ReplaceState state) {
    context.go(
        Uri(path: state.path, queryParameters: state.queryParams).toString(),
        extra: state.extra);
  }

  Future<dynamic> _navigate<T extends Object?>(
      BuildContext context, NavigateState state) async {
    return context.push(
        Uri(path: state.path, queryParameters: state.queryParams).toString(),
        extra: state.extra);
  }

  void _pop(BuildContext context, Object? extra) {
    if (context.canPop()) {
      if (extra == null) {
        context.pop();
      } else {
        context.pop(extra);
      }
    }
  }

  void _handleState(BuildContext context, Object? state) {
    if (state is NavigateState) {
      _navigateToRoute(context, context.read<B>(), state);
      return;
    }

    if (state is ReplaceState) {
      _replaceRoute(context, state);
      return;
    }

    if (state is PopState) {
      _pop(context, state.extra);
      return;
    }

    onListenableState(context, state);
  }
}
