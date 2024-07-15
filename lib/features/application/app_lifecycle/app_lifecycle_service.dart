import 'package:reacthome/features/application/app_lifecycle/app_lifecycle_api.dart';
import 'package:reacthome/features/application/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/features/emitter.dart';

class AppLifecycleService implements AppLifecycleApi {
  final Emitter<AppLifecycleEvent> eventSink;

  const AppLifecycleService({required this.eventSink});

  @override
  void makeActive() => eventSink.emit(AppLifecycleEvent.active);

  @override
  void makeInactive() => eventSink.emit(AppLifecycleEvent.inactive);
}
