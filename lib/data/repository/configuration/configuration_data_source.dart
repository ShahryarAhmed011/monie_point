import 'dart:ui';

import 'dto/configuration_dto.dart';

abstract class ConfigurationDataSource {
  ConfigurationDto get();
  void updateTheme(Brightness brightness);
}