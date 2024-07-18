import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base/dto.dart';

part 'configuration_dto.freezed.dart';

@freezed
class ConfigurationDto with _$ConfigurationDto implements Dto{
  const factory ConfigurationDto({
    required Brightness brightness
  }) = _ConfigurationDto;
}