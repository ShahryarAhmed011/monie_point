import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/domain.dart';
import '../../base/bloc/base_bloc.dart';
import 'configuration.dart';
import 'configuration_mapper.dart';
part 'global_event.dart';

part 'global_state.dart';

@injectable
class GlobalBloc extends BaseBloc<GlobalEvent, GlobalState> {
  final GetConfigurationUseCase getConfigurationUseCase;
  static const ConfigurationMapper mapper = ConfigurationMapper();

  GlobalBloc({required this.getConfigurationUseCase})
      : super(GlobalState(
            configuration: mapper.map(getConfigurationUseCase.get()))) {
    on<GlobalEvent>((event, emit) {});
  }
}
