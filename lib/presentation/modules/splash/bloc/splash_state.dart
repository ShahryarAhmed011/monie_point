part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {

}

class NavigateToHomeState extends ReplaceState implements SplashState {
  NavigateToHomeState() : super(path: Routes.home);

  @override
  List<Object?> get props => [DateTime.now()];
}




