import 'package:flutter/material.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui_kit/theme/theme_material.dart';

class AppRootMaterial {
  static Widget make(
    BuildContext context, {
    required String title,
    required Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    required Iterable<Locale> supportedLocales,
    required Color seedColor,
    required Navigation navigation,
  }) =>
      MaterialApp(
        title: title,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        themeMode: ThemeMode.system,
        theme: makeMaterialTheme(seedColor, Brightness.light),
        darkTheme: makeMaterialTheme(seedColor, Brightness.dark),
        initialRoute: navigation.initialRoute,
        routes: navigation.routes,
      );
}
