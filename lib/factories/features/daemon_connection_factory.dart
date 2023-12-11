import 'package:reacthome/factories/features/app_life_cycle_factory.dart';
import 'package:reacthome/factories/features/connection_factory.dart';
import 'package:reacthome/factories/features/discovery_factory.dart';
import 'package:reacthome/features/daemon_connection/application/active_connection_service.dart';
import 'package:reacthome/features/daemon_connection/application/daemon_connection_auto_service.dart';
import 'package:reacthome/features/daemon_connection/application/daemon_connection_lifecycle_service.dart';
import 'package:reacthome/features/daemon_connection/application/daemon_connection_service.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/util/repository.dart';

class DaemonConnectionFactory {
  static final instance = DaemonConnectionFactory._();

  late DaemonConnectionService<WebSocket> daemonConnectionService;

  DaemonConnectionFactory._() {
    daemonConnectionService = DaemonConnectionService(
      eventSink: ConnectionFactory.instance.connectionEventBus,
      local: (
        query: ConnectionFactory.instance.localConnectionService,
        actor: ConnectionFactory.instance.localConnectionService,
      ),
      cloud: (
        query: ConnectionFactory.instance.cloudConnectionService,
        actor: ConnectionFactory.instance.cloudConnectionService,
      ),
      repository: MapRepository(),
    );

    ActiveConnectionService(
      eventSource: ConnectionFactory.instance.connectionEventBus,
      actor: daemonConnectionService,
    );

    DaemonConnectionAutoService(
      eventSource: DiscoveryFactory.instance.daemonEventBus,
      query: DiscoveryFactory.instance.daemonService,
      actor: daemonConnectionService,
    );

    DaemonConnectionLifecycleService(
      eventSource: AppLifecycleFactory.instance.appLifecycleEventBus,
      query: DiscoveryFactory.instance.daemonService,
      actor: daemonConnectionService,
    );
  }
}
