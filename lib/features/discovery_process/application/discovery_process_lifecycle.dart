import 'package:reacthome/features/app_lifecycle/domain/app_lifecycle_event.dart';
import 'package:reacthome/features/discovery_process/application/discovery_process_service.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryProcessLifecycle extends BusListener<AppLifecycleEvent> {
  final DiscoveryProcessService process;

  DiscoveryProcessLifecycle(this.process,
      {required Bus<AppLifecycleEvent> eventSource})
      : super(eventSource);

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
