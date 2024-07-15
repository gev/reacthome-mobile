import 'package:reacthome/core/connection/connection_controller.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';
import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/features/connection_factory.dart';
import 'package:reacthome/make/features/home_connection_factory.dart';
import 'package:reacthome/make/features/home_factory.dart';
import 'package:reacthome/services/connection/active_connection_service.dart';
import 'package:reacthome/services/connection/connection_home_registry_service.dart';
import 'package:reacthome/services/connection/websocket_service.dart';

class ConnectionServiceFactory {
  ConnectionServiceFactory._();

  static LocalWebsocketService makeLocalWebsocketService() =>
      LocalWebsocketService(
        eventSource: ConnectionFactory.connectionEventBus.stream,
        connection: ConnectionFactory.makeLocalConnectionApi(),
        factory: LocalWebSocketFactory(
          config: Config.connection.local,
          controller: const ConnectionController(),
        ),
      );

  static CloudWebsocketService makeCloudWebsocketService() =>
      CloudWebsocketService(
        eventSource: ConnectionFactory.connectionEventBus.stream,
        connection: ConnectionFactory.makeCloudConnectionApi(),
        factory: CloudWebSocketFactory(
          config: Config.connection.cloud,
          controller: const ConnectionController(),
        ),
      );

  static ActiveConnectionService makeActiveConnectionService() =>
      ActiveConnectionService(
        eventSource: ConnectionFactory.connectionEventBus.stream,
        connection: HomeConnectionFactory.makeHomeConnectionApi(),
      );

  static Future<ConnectionHomeRegistryService>
      makeHomeConnectionAutoService() async => ConnectionHomeRegistryService(
            eventSource: HomeFactory.homeEventBus.stream,
            home: await HomeFactory.makeHomeApi(),
            connection: HomeConnectionFactory.makeHomeConnectionApi(),
          );

  static Future<void> make() async {
    makeLocalWebsocketService();
    makeCloudWebsocketService();
    makeActiveConnectionService();
    await makeHomeConnectionAutoService();
  }
}
