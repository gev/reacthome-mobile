import 'package:reacthome/features/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/features/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/features/app_lifecycle/app_lifecycle_service.dart';
import 'package:reacthome/infrastructure/bus/bus.dart';

class AppLifecycleFactory {
  static final instance = AppLifecycleFactory._();

  AppLifecycleFactory._();

  final appLifecycleEventBus = Bus<AppLifecycleEvent>();

  AppLifecycleApi makeAppLifecycleApi() => AppLifecycleService(
        eventSink: appLifecycleEventBus.sink,
      );
}
