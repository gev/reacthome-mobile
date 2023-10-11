import 'package:flutter/material.dart';
import 'package:reacthome/app/app_binding_observer.dart';
import 'package:reacthome/app/navigation.dart';

class AppAndroid extends AppBindingObserver {
  final Navigation navigation;
  final String title;

  AppAndroid(discovery, this.navigation, this.title, {super.key})
      : super(discovery);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      theme: ThemeData(useMaterial3: true),
      initialRoute: navigation.initialRoute(),
      routes: navigation.routes(),
    );
  }
}
