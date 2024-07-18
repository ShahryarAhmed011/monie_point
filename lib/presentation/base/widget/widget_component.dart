import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
abstract class WidgetComponent<
    Bloc extends BlocBase<BlocState>,
    BlocState,
    CurrentState extends BlocState> extends StatelessWidget {
  const WidgetComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onInit(context);
    return BlocBuilder<Bloc, BlocState>(
      builder: (_, state) => state.runtimeType == CurrentState
          ? buildComponent(context, state as CurrentState)
          : buildEmpty(context),
      buildWhen: (previous, current) => rebuildCondition(previous, current),
    );
  }


  

  void onInit(BuildContext context) {}

  Widget buildComponent(BuildContext context, CurrentState state);

  Widget buildEmpty(BuildContext context);

  bool rebuildCondition(BlocState? previous, BlocState? current) {
    return current is CurrentState;
  }
}
