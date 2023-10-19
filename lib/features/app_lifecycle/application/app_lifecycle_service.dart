import 'package:reacthome/core/app_lifecycle_event.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';

class AppLifecycleService extends SimpleBusEmitter<AppLifecycleEvent> {
  AppLifecycleService({required Bus<AppLifecycleEvent> eventSink})
      : super(eventSink);

  void makeActive() => emit(AppLifecycleEvent.active);
  void makeInactive() => emit(AppLifecycleEvent.inactive);
}
