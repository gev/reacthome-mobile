import 'package:reacthome/core/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/util/event_emitter.dart';

class AppLifecycleService extends GenericEventEmitter<AppLifecycleEvent>
    implements AppLifecycleApi {
  AppLifecycleService({required super.eventSink});

  @override
  void makeActive() => emit(AppLifecycleEvent.active);

  @override
  void makeInactive() => emit(AppLifecycleEvent.inactive);
}
