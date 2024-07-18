part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}
class LogoutEvent extends HomeEvent {
  const LogoutEvent();
  @override
  List<Object?> get props => [];
}
class GetUserDetailEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetAllChatAbleUserEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}