import 'package:flutter/material.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';

class AppRootMaterial {
  static Widget make({
    required String title,
    required Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    required Iterable<Locale> supportedLocales,
    required ThemeConfig theme,
    required Navigation navigation,
  }) =>
      MaterialApp(
        title: title,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        themeMode: ThemeMode.system,
        theme: _makeTheme(theme.primaryColor, Brightness.light),
        darkTheme: _makeTheme(theme.primaryColor, Brightness.dark),
        initialRoute: navigation.initialRoute,
        routes: navigation.routes,
      );

  static ThemeData _makeTheme(Color seedColor, Brightness brightness) =>
      ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: brightness,
          seedColor: seedColor,
          primary: seedColor,
        ),
      );
}
