import 'dart:ui';

import 'package:injectable/injectable.dart';

import '../../../domain/configuration/configuration_wrapper.dart';
import 'configuration_data_source.dart';
import 'dto/configuration_mapper.dart';

@injectable
class ConfigurationRepository  {
  final ConfigurationMapper _mapper = const ConfigurationMapper();
  final ConfigurationDataSource _configurationDataSource;

  ConfigurationRepository(
      {required ConfigurationDataSource configurationDataSource})
      : _configurationDataSource = configurationDataSource;

  ConfigurationWrapper getDefault() {
    return _mapper.map(_configurationDataSource.get());
  }


  ConfigurationWrapper updateTheme(Brightness brightness) {
    _configurationDataSource.updateTheme(brightness);
    return _mapper.map(_configurationDataSource.get());
  }
}
