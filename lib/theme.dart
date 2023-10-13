import 'package:flutter/material.dart';

class MainTheme {
  const MainTheme._();

  static ThemeData get data {
    final colorScheme = _colorScheme;

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primaryContainer,
      ),
    );
  }

  static ColorScheme get _colorScheme {
    const baseColorScheme = ColorScheme.light();

    return ColorScheme.fromSeed(
      seedColor: baseColorScheme.primary,
      primary: baseColorScheme.primary,
      secondary: baseColorScheme.secondary,
      error: baseColorScheme.error,
    );
  }
}
