import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui_kit/theme/theme_cupertino.dart';

class AppRootCupertino {
  static Widget make(
    BuildContext context, {
    required String title,
    required Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    required Iterable<Locale> supportedLocales,
    required Color seedColor,
    required Navigation navigation,
  }) =>
      CupertinoApp(
        title: title,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        theme: makeCupertinoTheme(
          seedColor,
          MediaQuery.platformBrightnessOf(context),
        ),
        initialRoute: navigation.initialRoute,
        routes: navigation.routes,
      );
}
