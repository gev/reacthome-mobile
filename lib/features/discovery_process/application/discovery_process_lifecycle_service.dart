import 'package:reacthome/core/app_lifecycle_event.dart';
import 'package:reacthome/features/discovery_process/application/discovery_process_service.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryProcessLifecycleService extends BusListener<AppLifecycleEvent> {
  final DiscoveryProcessService process;

  DiscoveryProcessLifecycleService({
    required Bus<AppLifecycleEvent> eventSource,
    required this.process,
  }) : super(eventSource);

  @override
  void run(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        process.start();
      case AppLifecycleEvent.inactive:
        process.stop();
    }
  }
}
