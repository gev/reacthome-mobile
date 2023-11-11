import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/features/connection/application/connection_service.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/repository.dart';

class Connection {
  static final instance = Connection._();

  late EventBus<ConnectionEvent> connectionEventBus;
  late ConnectionService<WebSocket> connectionService;

  Connection._() {
    connectionEventBus = EventBus();
    connectionService = ConnectionService(
      eventSink: connectionEventBus,
      repository: MapRepository(),
    );
  }
}
