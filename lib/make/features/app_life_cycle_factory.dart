import 'package:reacthome/core/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/features/app_lifecycle/infrastructure/app_lifecycle_service.dart';
import 'package:reacthome/infrastructure/bus/bus.dart';

class AppLifecycleFactory {
  static final instance = AppLifecycleFactory._();

  AppLifecycleFactory._();

  final appLifecycleEventBus = Bus<AppLifecycleEvent>();

  AppLifecycleApi makeAppLifecycleService() => AppLifecycleService(
        eventSink: appLifecycleEventBus.sink,
      );
}