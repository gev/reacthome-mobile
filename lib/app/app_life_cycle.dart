import 'package:reacthome/features/app_life_cycle/app_life_cycle_event.dart';
import 'package:reacthome/features/app_life_cycle/app_life_cycle_service.dart';
import 'package:reacthome/util/bus.dart';

class AppLifecycle {
  static final instance = AppLifecycle._();

  late AppLifecycleService service;
  late Bus<AppLifecycleEvent> eventBus;

  AppLifecycle._() {
    eventBus = Bus<AppLifecycleEvent>();
    service = AppLifecycleService(eventSink: eventBus);
  }
}
