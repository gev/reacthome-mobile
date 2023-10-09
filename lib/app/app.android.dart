import 'package:flutter/material.dart';
import 'package:reacthome/app/app.dart';
import 'package:reacthome/app/navigation.dart';

class AppAndroid extends App {
  final Navigation navigation;

  AppAndroid({super.key, required super.discovery, required this.navigation});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reacthome',
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: navigation.routes(),
      initialRoute: navigation.initialRoute,
    );
  }
}
