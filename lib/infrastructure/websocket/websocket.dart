import 'dart:async';
import 'dart:io' as io;

import 'package:reacthome/core/handler.dart';

class WebSocket {
  final io.WebSocket _socket;
  final StreamSubscription _subscription;

  const WebSocket._(this._socket, this._subscription);

  static Future<WebSocket> create({
    required String url,
    required Handler<dynamic> controller,
    Iterable<String>? protocols,
    required void Function() onClose,
    required void Function(Object) onError,
  }) async {
    final socket = await io.WebSocket.connect(url, protocols: protocols);
    socket.pingInterval = const Duration(seconds: 30);
    final subscription = socket.listen(
      controller.handle,
      onError: onError,
      onDone: onClose,
    );
    return WebSocket._(socket, subscription);
  }

  void close() {
    _subscription.cancel();
    _socket.close();
  }

  void send(String data) {
    _socket.add(data);
  }
}
