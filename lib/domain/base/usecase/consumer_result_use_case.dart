import 'package:flutter/material.dart';

import '../use_case_result.dart';

class ConsumerUseCaseResult {
  final OnError? onError;
  final VoidCallback? onFinished;

  ConsumerUseCaseResult({this.onError, this.onFinished});
}