import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/configuration/configuration_data_source.dart';
import '../../repository/configuration/dto/configuration_dto.dart';

@Injectable(as:ConfigurationDataSource)
class ConfigurationPersistence implements ConfigurationDataSource {
  final SharedPreferences _sharedPreferences;

  const ConfigurationPersistence({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  static const String _themeKey = "theme_key";

  static const String defaultBrightness = "light";

  @override
  ConfigurationDto get() {
    String brightnessValue =
        _sharedPreferences.getString(_themeKey) ?? defaultBrightness;
    Brightness brightness;
    if (brightnessValue == "light") {
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    return ConfigurationDto(brightness: brightness);
  }

  @override
  void updateTheme(Brightness brightness) {
    _sharedPreferences.setString(_themeKey, brightness.name);
  }
}
