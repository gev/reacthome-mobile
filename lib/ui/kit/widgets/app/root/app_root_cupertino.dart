import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/kit/theme/theme_cupertino.dart';
import 'package:reacthome/ui/theme_config.dart';

class AppRootCupertino {
  static Widget make(
    BuildContext context, {
    required String title,
    required Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    required Iterable<Locale> supportedLocales,
    required ThemeConfig theme,
    required Navigation navigation,
  }) =>
      CupertinoApp(
        title: title,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        theme: makeCupertinoTheme(
          theme.seedColor,
          MediaQuery.of(context).platformBrightness,
        ),
        initialRoute: navigation.initialRoute,
        routes: navigation.routes,
      );
}
