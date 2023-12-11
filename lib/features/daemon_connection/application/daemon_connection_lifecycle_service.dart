import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/util/event_listener.dart';

class DaemonConnectionLifecycleService
    extends GenericEventListener<AppLifecycleEvent> {
  final DaemonQuery query;
  final DaemonConnectionCommand actor;

  DaemonConnectionLifecycleService({
    required super.eventSource,
    required this.query,
    required this.actor,
  });

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        actor.connectAll(
            query.getAllDaemons().map((id) => query.getDaemonById(id)!));
      case AppLifecycleEvent.inactive:
        actor.disconnectAll();
    }
  }
}
