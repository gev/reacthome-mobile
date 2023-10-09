import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/features/discovery/discovery.dart';

import '../features/home/home_view_model.dart';

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
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(discovery),
        child: home,
      ),
    );
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    discovery.stop();
  }
}
