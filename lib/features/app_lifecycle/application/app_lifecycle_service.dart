import 'package:reacthome/core/app_lifecycle_event.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/event_bus.dart';

class AppLifecycleService extends EventEmitter<AppLifecycleEvent> {
  AppLifecycleService({required EventBus<AppLifecycleEvent> eventSink})
      : super(eventSink);

  void makeActive() => emit(AppLifecycleEvent.active);
  void makeInactive() => emit(AppLifecycleEvent.inactive);
}
