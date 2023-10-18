import 'package:reacthome/features/app_life_cycle/app_life_cycle_event.dart';
import 'package:reacthome/features/discovery/discovery_service.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryLifeCycle extends BusListener<AppLifecycleEvent> {
  final DiscoveryService discovery;

  DiscoveryLifeCycle(this.discovery,
      {required Bus<AppLifecycleEvent> eventSource})
      : super(eventSource);

  @override
  void run(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        discovery.start();
      case AppLifecycleEvent.inactive:
        discovery.stop();
    }
  }
}
