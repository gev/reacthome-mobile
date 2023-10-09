import 'package:flutter/cupertino.dart';
import 'package:reacthome/app/app.dart';
import 'package:reacthome/app/navigation.dart';

class AppIOS extends App {
  final Navigation navigation;

  AppIOS({super.key, required super.discovery, required this.navigation});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Reacthome',
      theme: const CupertinoThemeData(),
      routes: navigation.routes(),
      initialRoute: navigation.initialRoute,
    );
  }
}
