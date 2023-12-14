import 'package:reacthome/app/config.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/features/connection/application/connection_service.dart';
import 'package:reacthome/features/connection/infrastructure/websocket_service.dart';
import 'package:reacthome/features/connection/interface/connection_controller.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/repository.dart';

class ConnectionFactory {
  static final instance = ConnectionFactory._();

  late EventBus<ConnectionEvent> connectionEventBus;
  late LocalConnectionService<WebSocket> localConnectionService;
  late CloudConnectionService<WebSocket> cloudConnectionService;

  ConnectionFactory._() {
    connectionEventBus = GenericEventBus();

    localConnectionService = LocalConnectionService(
      eventSink: connectionEventBus,
      repository: MapRepository(),
    );

    cloudConnectionService = CloudConnectionService(
      eventSink: connectionEventBus,
      repository: MapRepository(),
    );

    final connectionController = ConnectionController();

    LocalWebsocketService(
      eventSource: connectionEventBus,
      actor: localConnectionService,
      factory: LocalWebSocketFactory(
        config: Config.connection.local,
        controller: connectionController,
      ),
    );

    CloudWebsocketService(
      eventSource: connectionEventBus,
      actor: cloudConnectionService,
      factory: CloudWebSocketFactory(
        config: Config.connection.cloud,
        controller: connectionController,
      ),
    );
  }
}
