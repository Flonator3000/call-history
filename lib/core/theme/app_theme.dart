import 'package:call_history/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) {
    final colorScheme = ColorScheme.fromSwatch(
      backgroundColor: Colors.white,
      primarySwatch: Colors.indigo,
      accentColor: Colors.orange,
    );

    final appBarTheme = AppBarTheme.of(context).copyWith();

    final inputDecorationTheme = InputDecorationTheme(
      filled: true,
      hintStyle: const TextStyle(color: AppColors.hintTextStyle),
      fillColor: Colors.white,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.primary, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.primary, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.secondary, width: 1),
      ),
    );

    const TextTheme textTheme = TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black),
      headlineLarge: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.black),
      labelMedium: TextStyle(color: Colors.black),
      labelSmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
    );

    final theme = Theme.of(context).copyWith(
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
    );

    return theme;
  }
}
