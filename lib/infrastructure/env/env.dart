import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

class RunningEnvironment {
  static Environment get runningEnv {
    if (kDebugMode) {
      return dev;
    }
    if (kProfileMode) {
      return const Environment("stage");
    }

    if (kReleaseMode) {
      return prod;
    }

    return dev;
  }
}