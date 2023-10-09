import 'package:flutter/cupertino.dart';
import 'package:reacthome/domains/discovery/discovery.dart';

class AppIOS extends StatelessWidget with WidgetsBindingObserver {
  final Discovery discovery;
  final Widget home;

  AppIOS({super.key, required this.discovery, required this.home}) {
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
    return CupertinoApp(
      title: 'Reacthome',
      theme: const CupertinoThemeData(),
      home: home,
    );
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    discovery.stop();
  }
}
