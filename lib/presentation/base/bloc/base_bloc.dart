import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  @protected
  Map<String, dynamic> queryParams = const <String, dynamic>{};

  @protected
  Map<String, String> parameter = const <String, String>{};

  Object? extra;

  @protected
  Object? navigationResult;

  BaseBloc(super.initialState);

  void updateQueryParams(Map<String, dynamic> params) {
    queryParams = params;
  }

  void updateExtra(Object? extra) {
    this.extra = extra;
  }

  void updateParameters(Map<String, String> params) {
    parameter = params;
  }

  @mustCallSuper
  void onNavigationResult(Object? navigationResult) {
    this.navigationResult = navigationResult;
  }
}
