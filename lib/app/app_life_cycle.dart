import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/features/app_lifecycle/application/app_lifecycle_service.dart';
import 'package:reacthome/util/event_bus.dart';

class AppLifecycle {
  static final instance = AppLifecycle._();

  late EventBus<AppLifecycleEvent> appLifecycleEventBus;
  late AppLifecycleService appLifecycleService;

  AppLifecycle._() {
    appLifecycleEventBus = EventBus<AppLifecycleEvent>();
    appLifecycleService = AppLifecycleService(eventSink: appLifecycleEventBus);
  }
}
