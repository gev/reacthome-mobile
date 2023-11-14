import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryLifecycleService extends EventListener<AppLifecycleEvent> {
  final DiscoveryCommand actor;

  DiscoveryLifecycleService({
    required super.eventSource,
    required this.actor,
  });

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        actor.start();
      case AppLifecycleEvent.inactive:
        actor.stop();
    }
  }
}
