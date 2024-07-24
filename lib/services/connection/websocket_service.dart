import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/connection/connection_api.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';

abstract class WebsocketService<F extends WebSocketFactory,
    E extends ConnectionEvent> extends BusListener<ConnectionEvent> {
  final ConnectionApi<WebSocket> connectionApi;
  final F factory;

  WebsocketService({
    required super.eventSource,
    required this.connectionApi,
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
      connectionApi.completeConnect(event.id, socket);
    } catch (e) {
      connectionApi.fail(event.id);
    }
  }

  void _reject(ConnectRejectedEvent<WebSocket> event) {
    event.socket.close();
  }

  void _completeDisconnect(DisconnectRequestedEvent<WebSocket> event) {
    event.socket.close();
    connectionApi.completeDisconnect(event.id);
  }
}

class LocalWebsocketService extends WebsocketService<LocalWebSocketFactory,
    LocalConnectRequestedEvent> {
  LocalWebsocketService({
    required super.eventSource,
    required super.connectionApi,
    required super.factory,
  });

  @override
  Future<WebSocket> _create(LocalConnectRequestedEvent event) => factory.create(
        address: event.address,
        onClose: () => connectionApi.disconnect(event.id),
        onError: (_) => connectionApi.disconnect(event.id),
      );
}

class CloudWebsocketService extends WebsocketService<CloudWebSocketFactory,
    CloudConnectRequestedEvent> {
  CloudWebsocketService({
    required super.eventSource,
    required super.connectionApi,
    required super.factory,
  });

  @override
  Future<WebSocket> _create(CloudConnectRequestedEvent event) => factory.create(
        id: event.id,
        onClose: () => connectionApi.disconnect(event.id),
        onError: (_) => connectionApi.disconnect(event.id),
      );
}
