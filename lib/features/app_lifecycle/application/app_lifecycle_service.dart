import 'package:reacthome/core/app_lifecycle/app_lifecycle_command.dart';
import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/util/event_emitter.dart';

class AppLifecycleService extends EventEmitter<AppLifecycleEvent>
    implements AppLifecycleCommand {
  AppLifecycleService({required super.eventSink});

  @override
  void makeActive() => emit(AppLifecycleEvent.active);

  @override
  void makeInactive() => emit(AppLifecycleEvent.inactive);
}
