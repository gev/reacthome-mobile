import 'package:reacthome/core/app_lifecycle_event.dart';
import 'package:reacthome/core/discovery_process_command.dart';
import 'package:reacthome/util/actor.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryProcessLifecycleService
    extends EventListener<AppLifecycleEvent> {
  final Actor<DiscoveryProcessCommand> actor;

  DiscoveryProcessLifecycleService({
    required EventBus<AppLifecycleEvent> eventSource,
    required this.actor,
  }) : super(eventSource);

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        actor.execute(DiscoveryProcessCommand.start);
      case AppLifecycleEvent.inactive:
        actor.execute(DiscoveryProcessCommand.stop);
    }
  }
}
