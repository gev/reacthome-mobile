import 'package:reacthome/features/application/connection/connection_api.dart';
import 'package:reacthome/features/application/connection/connection_event.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';

abstract class WebsocketService<F extends WebSocketFactory,
    E extends ConnectionEvent> extends BusListener<ConnectionEvent> {
  final ConnectionApi<WebSocket> connection;
  final F factory;

  WebsocketService({
    required super.eventSource,
    required this.connection,
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
    try {
      final socket = await _create(event);
      connection.completeConnect(event.id, socket);
    } catch (e) {
      connection.fail(event.id);
    }
  }

  void _reject(ConnectRejectedEvent<WebSocket> event) {
    event.socket.close();
  }

  void _completeDisconnect(DisconnectRequestedEvent<WebSocket> event) {
    event.socket.close();
    connection.completeDisconnect(event.id);
  }
}

class LocalWebsocketService extends WebsocketService<LocalWebSocketFactory,
    LocalConnectRequestedEvent> {
  LocalWebsocketService({
    required super.eventSource,
    required super.connection,
    required super.factory,
  });

  @override
  Future<WebSocket> _create(LocalConnectRequestedEvent event) => factory.create(
        address: event.address,
        onClose: () => connection.disconnect(event.id),
        onError: (_) => connection.disconnect(event.id),
      );
}

class CloudWebsocketService extends WebsocketService<CloudWebSocketFactory,
    CloudConnectRequestedEvent> {
  CloudWebsocketService({
    required super.eventSource,
    required super.connection,
    required super.factory,
  });

  @override
  Future<WebSocket> _create(CloudConnectRequestedEvent event) => factory.create(
        id: event.id,
        onClose: () => connection.disconnect(event.id),
        onError: (_) => connection.disconnect(event.id),
      );
}
