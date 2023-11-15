import 'dart:async';
import 'dart:io' as io;

import 'package:reacthome/util/handler.dart';

class WebSocket {
  final io.WebSocket _socket;
  final StreamSubscription _subscription;

  WebSocket._(this._socket, this._subscription);

  static Future<WebSocket> create({
    required String url,
    required Handler<dynamic> controller,
    Iterable<String>? protocols,
    required void Function() onClose,
  }) async {
    final socket = await io.WebSocket.connect(url, protocols: protocols);
    final subscription = socket.listen(
      controller.handle,
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
