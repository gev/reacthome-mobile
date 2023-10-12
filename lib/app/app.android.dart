import 'package:flutter/material.dart';
import 'package:reacthome/app/app_binding_observer.dart';
import 'package:reacthome/app/navigation.dart';
import 'package:reacthome/app/theme_config.dart';

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
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: theme.primaryColor,
      ),
      initialRoute: navigation.initialRoute,
      routes: navigation.routes,
    );
  }
}
