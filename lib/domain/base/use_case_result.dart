import 'package:flutter/material.dart';

typedef OnSuccess<T> = void Function(T data);
typedef OnError = void Function(Exception error);

class UseCaseResult<E> {
  final OnSuccess<E>? onSuccess;
  final OnError? onError;
  final VoidCallback? onFinished;

  UseCaseResult({this.onSuccess, this.onError, this.onFinished});
}
