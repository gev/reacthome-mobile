import 'package:flutter/material.dart';
import 'package:reacthome/infrastructure/ui/kit/theme/theme_material.dart';
import 'package:reacthome/infrastructure/ui/theme_config.dart';
import 'package:reacthome/ui/app/navigation.dart';

class AppRootMaterial {
  static Widget make(
    BuildContext context, {
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
        theme: makeMaterialTheme(theme.seedColor, Brightness.light),
        darkTheme: makeMaterialTheme(theme.seedColor, Brightness.dark),
        initialRoute: navigation.initialRoute,
        routes: navigation.routes,
      );
}
