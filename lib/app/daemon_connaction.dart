import 'package:reacthome/app/connection.dart';
import 'package:reacthome/features/daemon_connection.dart/application/active_connection_service.dart';
import 'package:reacthome/features/daemon_connection.dart/application/daemon_connection_service.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/util/repository.dart';

class DaemonConnection {
  static final instance = DaemonConnection._();

  late DaemonConnectionService<WebSocket> daemonConnectionService;

  DaemonConnection._() {
    daemonConnectionService = DaemonConnectionService(
      eventSink: Connection.instance.connectionEventBus,
      local: (
        query: Connection.instance.localConnectionService,
        actor: Connection.instance.localConnectionService,
      ),
      cloud: (
        query: Connection.instance.cloudConnectionService,
        actor: Connection.instance.cloudConnectionService,
      ),
      repository: MapRepository(),
    );

    ActiveConnectionService(
      eventSource: Connection.instance.connectionEventBus,
      connection: (actor: daemonConnectionService),
      local: (actor: Connection.instance.localConnectionService),
      cloud: (actor: Connection.instance.cloudConnectionService),
    );
  }
}
