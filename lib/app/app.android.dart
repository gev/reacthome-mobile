import 'package:flutter/material.dart';
import 'package:reacthome/app/app_binding_observer.dart';
import 'package:reacthome/app/navigation.dart';

class AppAndroid extends AppBindingObserver {
  final Navigation navigation;

  AppAndroid(discovery, this.navigation, {super.key}) : super(discovery);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reacthome',
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      theme: ThemeData(useMaterial3: true),
      initialRoute: navigation.initialRoute(),
      routes: navigation.routes(),
    );
  }
}
