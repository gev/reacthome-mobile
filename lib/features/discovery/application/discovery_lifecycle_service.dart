import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryLifecycleService extends GenericBusListener<AppLifecycleEvent> {
  final DiscoveryApi actor;

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
