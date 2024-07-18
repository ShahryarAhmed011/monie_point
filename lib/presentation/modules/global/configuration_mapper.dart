import 'package:flutter/material.dart';
import '../../../domain/configuration/configuration_wrapper.dart';
import '../../theme/app_theme.dart';
import 'configuration.dart';

class ConfigurationMapper {
  const ConfigurationMapper();
  Configuration map(ConfigurationWrapper wrapper) {
    AppTheme theme;
    if (wrapper.brightness == Brightness.dark) {
      theme = AppTheme.dark();
    }else {
      theme = AppTheme.light();
    }
    return Configuration(themeData: theme.themeData);
  }
}