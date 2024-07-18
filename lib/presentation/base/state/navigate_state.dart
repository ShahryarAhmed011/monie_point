import 'package:equatable/equatable.dart';

import 'listenable_state.dart';

abstract class NavigateState extends ListenableState implements Equatable {
  final String path;
  final Map<String, dynamic> queryParams;
  final Object? extra;

   NavigateState({
    required this.path,
    this.queryParams = const <String, dynamic>{},
    this.extra,
  });

   @override
  List<Object?> get props => [];
   @override
  bool? get stringify => null;
}
