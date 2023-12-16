import 'package:reacthome/app/features/app_life_cycle_factory.dart';
import 'package:reacthome/app/features/connection_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/features/daemon_connection/application/active_connection_service.dart';
import 'package:reacthome/features/daemon_connection/application/daemon_connection_auto_service.dart';
import 'package:reacthome/features/daemon_connection/application/daemon_connection_lifecycle_service.dart';
import 'package:reacthome/features/daemon_connection/application/daemon_connection_service.dart';
import 'package:reacthome/features/daemon_connection/domain/daemon_connection_entity.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/util/repository.dart';

class DaemonConnectionFactory {
  static final instance = DaemonConnectionFactory._();

  DaemonConnectionFactory._();

  final _repository = MapRepository<String, DaemonConnectionEntity>();

  DaemonConnectionService<WebSocket> makeDaemonConnectionService() {
    final localConnectionService =
        ConnectionFactory.instance.makeLocalConnectionService();

    final cloudConnectionService =
        ConnectionFactory.instance.makeCloudConnectionService();

    return DaemonConnectionService(
      eventSink: ConnectionFactory.instance.connectionEventBus,
      local: (
        query: localConnectionService,
        actor: localConnectionService,
      ),
      cloud: (
        query: cloudConnectionService,
        actor: cloudConnectionService,
      ),
      repository: _repository,
    );
  }

  ActiveConnectionService makeActiveConnectionService() =>
      ActiveConnectionService(
        eventSource: ConnectionFactory.instance.connectionEventBus,
        actor: makeDaemonConnectionService(),
      );

  DaemonConnectionAutoService makeDaemonConnectionAutoService() =>
      DaemonConnectionAutoService(
        eventSource: DiscoveryFactory.instance.daemonEventBus,
        query: DiscoveryFactory.instance.makeDaemonService(),
        actor: makeDaemonConnectionService(),
      );

  DaemonConnectionLifecycleService makeDaemonConnectionLifecycleService() =>
      DaemonConnectionLifecycleService(
        eventSource: AppLifecycleFactory.instance.appLifecycleEventBus,
        query: DiscoveryFactory.instance.makeDaemonService(),
        actor: makeDaemonConnectionService(),
      );
}
