import 'package:flutter/cupertino.dart';
import 'package:reacthome/app/app.dart';

class AppIOS extends App {
  final Widget home;

  AppIOS({super.key, required super.discovery, required this.home});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Reacthome',
      theme: const CupertinoThemeData(),
      home: home,
    );
  }
}
