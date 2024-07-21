import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';
import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/controllers/reacthome_controller_factory.dart';
import 'package:reacthome/make/core/connection_factory.dart';
import 'package:reacthome/make/core/home_connection_factory.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/services/connection/active_connection_service.dart';
import 'package:reacthome/services/connection/connection_home_registry_service.dart';
import 'package:reacthome/services/connection/reconnect_local_service.dart';
import 'package:reacthome/services/connection/websocket_service.dart';

class ConnectionServiceFactory {
  ConnectionServiceFactory._();

  static LocalWebsocketService makeLocalWebsocketService() =>
      LocalWebsocketService(
        eventSource: ConnectionFactory.connectionEventBus.stream,
        connection: ConnectionFactory.makeLocalConnectionApi(),
        factory: LocalWebSocketFactory(
          config: Config.connection.local,
          controller: ReacthomeControllerFactory.make(),
        ),
      );

  static CloudWebsocketService makeCloudWebsocketService() =>
      CloudWebsocketService(
        eventSource: ConnectionFactory.connectionEventBus.stream,
        connection: ConnectionFactory.makeCloudConnectionApi(),
        factory: CloudWebSocketFactory(
          config: Config.connection.cloud,
          controller: ReacthomeControllerFactory.make(),
        ),
      );

  static ActiveConnectionService makeActiveConnectionService() =>
      ActiveConnectionService(
        eventSource: ConnectionFactory.connectionEventBus.stream,
        connection: HomeConnectionFactory.makeHomeConnectionApi(),
      );

  static Future<ConnectionHomeRegistryService>
      makeConnectionHomeRegistryService() async =>
          ConnectionHomeRegistryService(
            eventSource: HomeFactory.homeEventBus.stream,
            home: await HomeFactory.makeHomeApi(),
            connection: HomeConnectionFactory.makeHomeConnectionApi(),
          );

  static ReconnectLocalService makeReconnectLocalService() =>
      ReconnectLocalService(
        eventSource: HomeFactory.homeEventBus.stream,
        connection: HomeConnectionFactory.makeHomeConnectionApi(),
      );

  static Future<void> make() async {
    makeLocalWebsocketService();
    makeCloudWebsocketService();
    makeActiveConnectionService();
    makeReconnectLocalService();
    await makeConnectionHomeRegistryService();
  }
}
