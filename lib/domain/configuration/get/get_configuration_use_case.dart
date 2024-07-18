
import 'package:injectable/injectable.dart';

import '../../../data/data.dart';
import '../../base/usecase/synchronous_usecase.dart';
import '../configuration_wrapper.dart';

@injectable
class GetConfigurationUseCase extends SynchronousUseCase {
  final ConfigurationRepository _configurationRepository;

  const GetConfigurationUseCase(
      {required ConfigurationRepository configurationRepository})
      : _configurationRepository = configurationRepository;

  ConfigurationWrapper get() {
    return _configurationRepository.getDefault();
  }
}
