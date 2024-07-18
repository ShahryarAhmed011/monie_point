import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app_dependency_component.config.dart';

final GetIt getIt = GetIt.instance;

const stage = Environment("stage");

@InjectableInit(
  initializerName: r'initGetIt',
  preferRelativeImports: true,
)
Future<void> createDependencyGraph([Environment environment = dev]) async {
  log("===================== CREATING PROJECT IN ${environment.name} ===================== ");
  getIt.initGetIt(environment: environment.name);
}
