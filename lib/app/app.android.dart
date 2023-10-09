import 'package:flutter/material.dart';
import 'package:reacthome/app/app.dart';

class AppAndroid extends App {
  final Widget home;

  AppAndroid({super.key, required super.discovery, required this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reacthome',
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: home,
    );
  }
}
