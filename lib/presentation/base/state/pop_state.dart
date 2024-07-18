import 'package:equatable/equatable.dart';

import 'listenable_state.dart';

abstract class PopState extends ListenableState implements Equatable{
  final Object? extra;

  PopState({
    this.extra,
  });

  @override
  List<Object?> get props => [];
  @override
  bool? get stringify => null;
}
