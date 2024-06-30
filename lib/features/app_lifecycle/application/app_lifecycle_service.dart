import 'package:reacthome/core/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/util/bus_emitter.dart';

class AppLifecycleService extends GenericBusEmitter<AppLifecycleEvent>
    implements AppLifecycleApi {
  AppLifecycleService({required super.eventSink});

  @override
  void makeActive() => emit(AppLifecycleEvent.active);

  @override
  void makeInactive() => emit(AppLifecycleEvent.inactive);
}
