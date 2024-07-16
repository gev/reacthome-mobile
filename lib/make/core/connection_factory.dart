import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_entity.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_service.dart';
import 'package:reacthome/infrastructure/bus/bus.dart';
import 'package:reacthome/infrastructure/repository/memory_repository.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';

class ConnectionFactory {
  ConnectionFactory._();

  static final _localConnectionRepository =
      MemoryRepository<String, LocalConnectionEntity<WebSocket>>();

  static final _cloudConnectionRepository =
      MemoryRepository<String, CloudConnectionEntity<WebSocket>>();

  static final connectionEventBus = Bus<ConnectionEvent>();

  static LocalConnectionApi<WebSocket> makeLocalConnectionApi() =>
      LocalConnectionService(
        eventSink: connectionEventBus.sink,
        repository: _localConnectionRepository,
      );

  static CloudConnectionApi<WebSocket> makeCloudConnectionApi() =>
      CloudConnectionService(
        eventSink: connectionEventBus.sink,
        repository: _cloudConnectionRepository,
      );
}
