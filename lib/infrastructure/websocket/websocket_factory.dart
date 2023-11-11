import 'dart:io' as io;

import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/infrastructure/websocket/websocket_config.dart';
import 'package:reacthome/util/handler.dart';

class WebSocketFactory {
  final WebSocketConfig config;
  final Handler<String> controller;

  WebSocketFactory({required this.config, required this.controller});

  Future<WebSocket> local(io.InternetAddress address) => WebSocket.create(
        url: 'ws://$address:${config.localPort}',
        controller: controller,
      );

  Future<WebSocket> cloud(String id) => WebSocket.create(
        url: 'wss://${config.cloudURL}/id',
        controller: controller,
        protocols: [config.protocol],
      );
}
