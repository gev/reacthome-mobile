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
      case ConnectRejectedEvent<WebSocket> e:
        _reject(e);
      case DisconnectRequestedEvent<WebSocket> e:
        _completeDisconnect(e);
      default:
    }
  }

  Future<WebSocket> _create(E event);

  void _completeConnect(E event) async {
    final socket = await _create(event);
    actor.completeConnect(event.id, socket);
  }

  void _reject(ConnectRejectedEvent<WebSocket> event) {
    event.socket.close();
  }

  void _completeDisconnect(DisconnectRequestedEvent<WebSocket> event) {
    actor.completeDisconnect(event.id);
  }
}

class LocalWebsocketService extends WebsocketService<LocalWebSocketFactory,
    LocalConnectRequestedEvent> {
  LocalWebsocketService({
    required super.eventSource,
    required super.actor,
    required super.factory,
  });

  @override
  Future<WebSocket> _create(LocalConnectRequestedEvent event) =>
      factory.create(event.address);
}

class CloudWebsocketService extends WebsocketService<CloudWebSocketFactory,
    CloudConnectRequestedEvent> {
  CloudWebsocketService({
    required super.eventSource,
    required super.actor,
    required super.factory,
  });

  @override
  Future<WebSocket> _create(CloudConnectRequestedEvent event) =>
      factory.create(event.id);
}
