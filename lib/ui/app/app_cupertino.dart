import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';

class AppCupertino {
  static WidgetBuilder build(
    String title,
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
    Iterable<Locale> supportedLocales,
    ThemeConfig theme,
    Navigation navigation,
  ) =>
      (_) => CupertinoApp(
            title: title,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            theme: CupertinoThemeData(primaryColor: theme.primaryColor),
            initialRoute: navigation.initialRoute,
            routes: navigation.routes,
          );
}
