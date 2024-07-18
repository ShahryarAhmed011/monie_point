import 'package:flutter/material.dart';
import '../../extensions/context_extensions.dart';
import '../../theme/app_color_scheme.dart';

mixin ScreenMixin {
  AppColorScheme colorScheme(BuildContext context) {
    return context.appColorScheme;
  }

  TextTheme textTheme(BuildContext context) {
    return context.textTheme;
  }
}
