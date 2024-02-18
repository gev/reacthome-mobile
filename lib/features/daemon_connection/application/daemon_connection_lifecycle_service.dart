import 'package:reacthome/core/app_lifecycle/app_lifecycle_event.dart';
import 'package:reacthome/core/daemon/daemon_api.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_api.dart';
import 'package:reacthome/util/event_listener.dart';

class DaemonConnectionLifecycleService
    extends GenericEventListener<AppLifecycleEvent> {
  final DaemonApi daemon;
  final DaemonConnectionApi connection;

  DaemonConnectionLifecycleService({
    required super.eventSource,
    required this.daemon,
    required this.connection,
  });

  @override
  void handle(AppLifecycleEvent event) {
    switch (event) {
      case AppLifecycleEvent.active:
        connection.connectAll(
            daemon.getAllDaemons().map((id) => daemon.getDaemonById(id)!));
      case AppLifecycleEvent.inactive:
        connection.disconnectAll();
    }
  }
}
