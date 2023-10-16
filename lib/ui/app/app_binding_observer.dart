import 'package:flutter/widgets.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';

abstract class AppBindingObserver extends StatelessWidget
    with WidgetsBindingObserver {
  final DiscoveryModel discovery;

  AppBindingObserver(this.discovery, {super.key}) {
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
