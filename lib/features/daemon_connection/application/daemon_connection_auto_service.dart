import 'package:reacthome/core/daemon/daemon_api.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_api.dart';
import 'package:reacthome/util/event_listener.dart';
import 'package:reacthome/util/extensions.dart';

class DaemonConnectionAutoService extends GenericEventListener<DaemonEvent> {
  final DaemonApi daemon;
  final DaemonConnectionApi connection;

  DaemonConnectionAutoService({
    required super.eventSource,
    required this.daemon,
    required this.connection,
  });

  @override
  void handle(DaemonEvent event) {
    switch (event) {
      case DaemonAddedEvent e:
        daemon.getDaemonById(e.daemon)?.let(connection.connect);
      default:
    }
  }
}
