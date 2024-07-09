import 'package:reacthome/app/config.dart';
import 'package:reacthome/app/features/home_connection_factory.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/features/connection/application/connection_service.dart';
import 'package:reacthome/features/connection/domain/connection_entity.dart';
import 'package:reacthome/features/connection/infrastructure/websocket_service.dart';
import 'package:reacthome/features/connection/interface/connection_controller.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/repository.dart';

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
        actor: makeLocalConnectionService(),
        factory: LocalWebSocketFactory(
          config: Config.connection.local,
          controller: ConnectionController(),
        ),
      );

  CloudWebsocketService makeCloudWebsocketService() => CloudWebsocketService(
        eventSource: connectionEventBus.stream,
        actor: makeCloudConnectionService(),
        factory: CloudWebSocketFactory(
          config: Config.connection.cloud,
          controller: ConnectionController(),
        ),
      );

  ConnectionViewModel makeConnectionViewModel() => ConnectionViewModel(
        eventSource: connectionEventBus.stream,
        homeConnection:
            HomeConnectionFactory.instance.makeHomeConnectionService(),
        local: makeLocalConnectionService(),
        cloud: makeCloudConnectionService(),
        home: HomeFactory.instance.makeHomeService(),
      );
}
