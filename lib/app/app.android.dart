import 'package:flutter/material.dart';
import 'package:reacthome/domains/discovery/discovery.dart';

class AppAndroid extends StatelessWidget with WidgetsBindingObserver {
  final Discovery discovery;
  final Widget home;

  AppAndroid({super.key, required this.discovery, required this.home}) {
    WidgetsBinding.instance.addObserver(this);
    discovery.start();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        discovery.start();
      case AppLifecycleState.paused:
        discovery.stop();
      default:
    }
  }

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

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    discovery.stop();
  }
}
