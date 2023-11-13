import 'dart:io' as io;

import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_config.dart';
import 'package:reacthome/util/handler.dart';

abstract class WebSocketFactory {
  final Handler<String> controller;

  WebSocketFactory({required this.controller});
}

class LocalWebSocketFactory extends WebSocketFactory {
  final LocalWebSocketConfig config;

  LocalWebSocketFactory({
    required this.config,
    required super.controller,
  });

  Future<WebSocket> create(io.InternetAddress address) => WebSocket.create(
        url: 'ws://$address:${config.port}',
        controller: controller,
      );
}

class CloudWebSocketFactory extends WebSocketFactory {
  final CloudWebSocketConfig config;

  CloudWebSocketFactory({
    required this.config,
    required super.controller,
  });

  Future<WebSocket> create(String id) => WebSocket.create(
        url: 'wss://${config.url}/id',
        controller: controller,
        protocols: [config.protocol],
      );
}
