import 'package:flutter/material.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';

class AppMaterial {
  static WidgetBuilder build(
    String title,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    Iterable<Locale> supportedLocales,
    ThemeConfig theme,
    Navigation navigation,
  ) =>
      (_) => MaterialApp(
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
        ),
      );
}
