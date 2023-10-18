import 'package:reacthome/features/app_life_cycle/app_life_cycle_event.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';

class AppLifecycleService extends SimpleBusEmitter<AppLifecycleEvent> {
  AppLifecycleService({required Bus<AppLifecycleEvent> eventSink})
      : super(eventSink);

  void makeActive() => emit(AppLifecycleEvent.active);
  void makeInactive() => emit(AppLifecycleEvent.inactive);
}
