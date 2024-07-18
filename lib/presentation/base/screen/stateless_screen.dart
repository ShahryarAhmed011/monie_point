import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/base_bloc.dart';
import '../state/listenable_state.dart';
import '../state/navigate_state.dart';
import '../state/pop_state.dart';
import '../state/replace_state.dart';
import 'screen_mixin.dart';

abstract class StatelessScreen<B extends BaseBloc> extends StatelessWidget
    with ScreenMixin {
  final B bloc;

  const StatelessScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(runtimeType);
    return BlocProvider.value(
      value: bloc,
      child: Builder(
        builder: (context) => BlocListener(
          bloc: bloc,
          listenWhen: _listenCondition,
          listener: (context, state) {
            _handleState(context, state);
          },
          child: buildScreen(context),
        ),
      ),
    );
  }

  Widget buildScreen(BuildContext context);

  bool _listenCondition(Object? previous, Object? current) {
    return current is ListenableState && current != previous;
  }

  void onListenableState(BuildContext context, Object? state) {}

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

  Future<T?> _navigate<T extends Object?>(
      BuildContext context, NavigateState state) {
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
      _navigateToRoute(context, bloc, state);
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
