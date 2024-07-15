import 'package:reacthome/features/connection/connection_entity.dart';
import 'package:reacthome/features/connection/connection_event.dart';
import 'package:reacthome/features/connection/connection_service.dart';
import 'package:reacthome/features/connection/infrastructure/connection_controller.dart';
import 'package:reacthome/features/connection/infrastructure/websocket_service.dart';
import 'package:reacthome/infrastructure/bus/bus.dart';
import 'package:reacthome/infrastructure/repository/map_repository.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';
import 'package:reacthome/make/config.dart';
import 'package:reacthome/make/features/home_connection_factory.dart';
import 'package:reacthome/make/features/home_factory.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';

class ConnectionFactory {
  static final instance = ConnectionFactory._();

  ConnectionFactory._();

  final _localConnectionRepository =
      MapRepository<String, LocalConnectionEntity<WebSocket>>();

  final _cloudConnectionRepository =
      MapRepository<String, CloudConnectionEntity<WebSocket>>();

  final connectionEventBus = Bus<ConnectionEvent>();

  LocalConnectionService<WebSocket> makeLocalConnectionService() =>
      LocalConnectionService(
        eventSink: connectionEventBus.sink,
        repository: _localConnectionRepository,
      );

  CloudConnectionService<WebSocket> makeCloudConnectionService() =>
      CloudConnectionService(
        eventSink: connectionEventBus.sink,
        repository: _cloudConnectionRepository,
      );

  LocalWebsocketService makeLocalWebsocketService() => LocalWebsocketService(
        eventSource: connectionEventBus.stream,
        connection: makeLocalConnectionService(),
        factory: LocalWebSocketFactory(
          config: Config.connection.local,
          controller: const ConnectionController(),
        ),
      );

  CloudWebsocketService makeCloudWebsocketService() => CloudWebsocketService(
        eventSource: connectionEventBus.stream,
        connection: makeCloudConnectionService(),
        factory: CloudWebSocketFactory(
          config: Config.connection.cloud,
          controller: const ConnectionController(),
        ),
      );

  Future<ConnectionViewModel> makeConnectionViewModel() async =>
      ConnectionViewModel(
        eventSource: connectionEventBus.stream,
        homeConnection:
            HomeConnectionFactory.instance.makeHomeConnectionService(),
        local: makeLocalConnectionService(),
        cloud: makeCloudConnectionService(),
        home: await HomeFactory.instance.makeHomeService(),
      );
}
