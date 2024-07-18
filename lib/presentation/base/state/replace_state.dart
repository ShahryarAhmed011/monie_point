import 'package:equatable/equatable.dart';

import 'listenable_state.dart';

abstract class ReplaceState extends ListenableState implements Equatable{
  final String path;
  final Map<String, String> params;
  final Map<String, dynamic> queryParams;
  final Object? extra;

  ReplaceState({
    required this.path,
    this.params = const <String, String>{},
    this.queryParams = const <String, dynamic>{},
    this.extra,
  });

  @override
  List<Object?> get props => [];
  @override
  bool? get stringify => null;
}
