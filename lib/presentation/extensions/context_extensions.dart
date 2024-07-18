import 'package:flutter/material.dart';
import '../theme/app_color_scheme.dart';

extension ContextExtensions on BuildContext {
  AppColorScheme get appColorScheme =>
      Theme.of(this).brightness == Brightness.light
          ? AppColorScheme.light()
          : AppColorScheme.dark();

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get screenSize => MediaQuery.of(this).size;

  double get keyboardPadding => MediaQuery.of(this).viewInsets.bottom;
}
