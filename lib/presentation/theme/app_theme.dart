import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_scheme.dart';

class AppTheme {
  final ThemeData themeData;

  AppTheme.light()
      : themeData = ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          textTheme: GoogleFonts.ralewayTextTheme(),
          colorScheme: AppColorScheme.light(),
        );

  AppTheme.dark()
      : themeData = ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          textTheme: GoogleFonts.ralewayTextTheme(),
          colorScheme: AppColorScheme.dark(),
        );
}
