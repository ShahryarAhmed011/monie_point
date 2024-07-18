
import '../../../../domain/configuration/configuration_wrapper.dart';
import '../../base/wrapper_mapper.dart';
import 'configuration_dto.dart';

class ConfigurationMapper extends WrapperMapper<ConfigurationWrapper,ConfigurationDto> {
  const ConfigurationMapper();
  @override
  ConfigurationWrapper map(ConfigurationDto dto) {
    return ConfigurationWrapper(brightness: dto.brightness);
  }
}