import 'package:reacthome/core/app_lifecycle_event.dart';
import 'package:reacthome/features/app_lifecycle/application/app_lifecycle_service.dart';
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
