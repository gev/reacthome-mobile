import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/features/app_lifecycle/application/app_lifecycle_service.dart';
import 'package:reacthome/util/event_bus.dart';

class AppLifecycleFactory {
  static final instance = AppLifecycleFactory._();

  late EventBus<AppLifecycleEvent> appLifecycleEventBus;
  late AppLifecycleService appLifecycleService;

  AppLifecycleFactory._() {
    appLifecycleEventBus = GenericEventBus();
    appLifecycleService = AppLifecycleService(eventSink: appLifecycleEventBus);
  }
}
