import 'package:reacthome/core/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/infrastructure/bus/bus_emitter.dart';

class AppLifecycleService extends GenericBusEmitter<AppLifecycleEvent>
    implements AppLifecycleApi {
  const AppLifecycleService({required super.eventSink});

  @override
  void makeActive() => emit(AppLifecycleEvent.active);

  @override
  void makeInactive() => emit(AppLifecycleEvent.inactive);
}