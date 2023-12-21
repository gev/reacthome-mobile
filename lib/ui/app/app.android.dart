import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reacthome/ui/app/app_binding_observer.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/theme_config.dart';

class AppAndroid extends AppBindingObserver {
  final ThemeConfig theme;
  final Navigation navigation;
  final String title;

  AppAndroid(this.theme, this.navigation, this.title,
      {required super.actor, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      themeMode: ThemeMode.system,
      theme: _makeTheme(Brightness.light),
      darkTheme: _makeTheme(Brightness.dark),
      initialRoute: navigation.initialRoute,
      routes: navigation.routes,
    );
  }

  ThemeData _makeTheme(Brightness brightness) => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: brightness,
          seedColor: theme.primaryColor,
        ),
      );
}
