import 'package:flutter/material.dart';
import 'package:reacthome/ui/app/app_binding_observer.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/app/theme_config.dart';

class AppAndroid extends AppBindingObserver {
  final ThemeConfig theme;
  final Navigation navigation;
  final String title;

  AppAndroid(this.theme, this.navigation, this.title, discovery, {super.key})
      : super(discovery);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      themeMode: ThemeMode.system,
      theme: _makeTheme(Brightness.light),
      darkTheme: _makeTheme(Brightness.dark),
      initialRoute: navigation.initialRoute,
      routes: navigation.routes,
    );
  }

  ThemeData _makeTheme(Brightness brightness) => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: brightness,
          seedColor: theme.primaryColor,
        ),
      );
}
