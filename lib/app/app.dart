import 'package:flutter/widgets.dart';
import 'package:reacthome/domains/discovery/discovery.dart';

abstract class App extends StatelessWidget with WidgetsBindingObserver {
  final Discovery discovery;

  App({super.key, required this.discovery}) {
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

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    discovery.stop();
  }
}
