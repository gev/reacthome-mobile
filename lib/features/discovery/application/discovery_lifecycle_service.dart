import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryLifecycleService extends GenericBusListener<AppLifecycleEvent> {
  final DiscoveryApi discovery;

  DiscoveryLifecycleService({
    required super.eventSource,
    required this.discovery,
  });

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        discovery.start();
      case AppLifecycleEvent.inactive:
        discovery.stop();
    }
  }
}
