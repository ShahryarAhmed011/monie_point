import 'package:equatable/equatable.dart';
import '../../../base/bloc/base_bloc.dart';
import '../../../base/state/replace_state.dart';
import '../../../route/routes.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc()  : super(HomeInitial());
}
