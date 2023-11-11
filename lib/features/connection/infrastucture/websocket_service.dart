import 'dart:io';

import 'package:reacthome/core/connection/connection_command.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_factory.dart';
import 'package:reacthome/util/event_listener.dart';

class WebsocketService extends EventListener<ConnectionEvent> {
  final ConnectionCommand actor;
  final WebSocketFactory factory;

  WebsocketService({
    required super.eventSource,
    required this.actor,
    required this.factory,
  });

  @override
  void handle(ConnectionEvent event) {
    switch (event) {
      case ConnectionEventLocalConnectRequested e:
        _completeLocalConnect(e.id, e.address);
      case ConnectionEventRemoteConnectRequested e:
        _completeRemoteConnect(e.id);
      case ConnectionEventRejected<WebSocket> e:
        _reject(e.socket);
      case ConnectionEventDisconnectRequested<WebSocket> e:
        _completeDisconnect(e.socket);
      default:
    }
  }

  void _completeLocalConnect(String id, InternetAddress address) async {
    final socket = await factory.local(address);
    actor.completeLocalConnect(id: id, socket: socket);
  }

  void _completeRemoteConnect(String id) async {
    final socket = await factory.remote(id);
    actor.completeRemoteConnect(id: id, socket: socket);
  }

  void _reject(WebSocket socket) {
    socket.close();
  }

  void _completeDisconnect(WebSocket socket) {}
}
