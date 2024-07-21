import 'package:reacthome/common/bus/bus.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_service.dart';

class AppLifecycleFactory {
  AppLifecycleFactory._();

  static final appLifecycleEventBus = Bus<AppLifecycleEvent>();

  static AppLifecycleApi makeAppLifecycleApi() => AppLifecycleService(
        eventSink: appLifecycleEventBus.sink,
      );
}
