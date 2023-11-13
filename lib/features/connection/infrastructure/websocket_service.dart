import 'package:reacthome/core/connection/connection_command.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';
import 'package:reacthome/util/event_listener.dart';

abstract class WebsocketService<F extends WebSocketFactory,
    E extends ConnectionEvent> extends EventListener<ConnectionEvent> {
  final ConnectionCommand<WebSocket> actor;
  final F factory;

  WebsocketService({
    required super.eventSource,
    required this.actor,
    required this.factory,
  });

  @override
  void handle(ConnectionEvent event) {
    switch (event) {
      case E e:
        _completeConnect(e);
      case ConnectionEventRejected<WebSocket> e:
        _reject(e);
      case ConnectionEventDisconnectRequested<WebSocket> e:
        _completeDisconnect(e);
      default:
    }
  }

  Future<WebSocket> _create(E event);

  void _completeConnect(E event) async {
    final socket = await _create(event);
    actor.completeConnect(event.id, socket);
  }

  void _reject(ConnectionEventRejected<WebSocket> event) {
    event.socket.close();
  }

  void _completeDisconnect(
      ConnectionEventDisconnectRequested<WebSocket> event) {
    actor.completeDisconnect(event.id);
  }
}

class LocalWebsocketService extends WebsocketService<LocalWebSocketFactory,
    ConnectionEventLocalConnectRequested> {
  LocalWebsocketService({
    required super.eventSource,
    required super.actor,
    required super.factory,
  });

  @override
  Future<WebSocket> _create(ConnectionEventLocalConnectRequested event) =>
      factory.create(event.address);
}

class CloudWebsocketService extends WebsocketService<CloudWebSocketFactory,
    ConnectionEventCloudConnectRequested> {
  CloudWebsocketService({
    required super.eventSource,
    required super.actor,
    required super.factory,
  });

  @override
  Future<WebSocket> _create(ConnectionEventCloudConnectRequested event) =>
      factory.create(event.id);
}
