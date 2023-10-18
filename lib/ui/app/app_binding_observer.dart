import 'package:flutter/widgets.dart';
import 'package:reacthome/features/app_life_cycle/app_life_cycle_service.dart';

abstract class AppBindingObserver extends StatelessWidget
    with WidgetsBindingObserver {
  final AppLifecycleService appLifeCycle;

  AppBindingObserver({required this.appLifeCycle, super.key}) {
    WidgetsBinding.instance.addObserver(this);
    appLifeCycle.makeActive();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        appLifeCycle.makeActive();
      case AppLifecycleState.paused:
        appLifeCycle.makeInactive();
      default:
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    appLifeCycle.makeInactive();
  }
}
