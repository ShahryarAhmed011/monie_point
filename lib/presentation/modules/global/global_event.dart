part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {
  const GlobalEvent();
}

class ChangeThemeEvent extends GlobalEvent {
  final Brightness brightness;
  const ChangeThemeEvent({required this.brightness});
}

class ChangeLanguageEvent extends GlobalEvent {
  final String locale;
  const ChangeLanguageEvent({required this.locale});
}