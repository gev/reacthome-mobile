import 'dart:io' as io;

import 'package:reacthome/common/handler.dart';
import 'package:reacthome/infrastructure/websocket/websocket.dart';
import 'package:reacthome/make/config/websocket_config.dart';

abstract class WebSocketFactory {
  final Handler<String> controller;

  const WebSocketFactory({
    required this.controller,
  });
}

class LocalWebSocketFactory extends WebSocketFactory {
  final LocalWebSocketConfig config;

  const LocalWebSocketFactory({
    required this.config,
    required super.controller,
  });

  Future<WebSocket> create({
    required io.InternetAddress address,
    required void Function() onClose,
    required void Function(Object) onError,
  }) =>
      WebSocket.create(
        url: 'ws://${address.address}:${config.port}',
        controller: controller,
        onClose: onClose,
        onError: onError,
      );
}

class CloudWebSocketFactory extends WebSocketFactory {
  final CloudWebSocketConfig config;

  const CloudWebSocketFactory({
    required this.config,
    required super.controller,
  });

  Future<WebSocket> create({
    required String id,
    required void Function() onClose,
    required void Function(Object) onError,
  }) =>
      WebSocket.create(
        url: 'wss://${config.url}/$id',
        controller: controller,
        protocols: [config.protocol],
        onClose: onClose,
        onError: onError,
      );
}
