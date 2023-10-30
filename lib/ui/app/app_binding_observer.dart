import 'package:flutter/widgets.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_command.dart';

abstract class AppBindingObserver extends StatelessWidget
    with WidgetsBindingObserver {
  final AppLifecycleCommand actor;

  AppBindingObserver({required this.actor, super.key}) {
    WidgetsBinding.instance.addObserver(this);
    actor.makeActive();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        actor.makeActive();
      case AppLifecycleState.paused:
        actor.makeInactive();
      default:
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    actor.makeInactive();
  }
}
