import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/util/event_listener.dart';
import 'package:reacthome/util/extensions.dart';

class DaemonConnectionAutoService extends GenericEventListener<DaemonEvent> {
  final DaemonQuery query;
  final DaemonConnectionCommand actor;

  DaemonConnectionAutoService({
    required super.eventSource,
    required this.query,
    required this.actor,
  });

  @override
  void handle(DaemonEvent event) {
    switch (event) {
      case DaemonAddedEvent e:
        query.getDaemonById(e.daemon)?.let(actor.connect);
      default:
    }
  }
}
