import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:reacthome/util/closable.dart';
import 'package:reacthome/util/handler.dart';

class MulticastSource implements Closable {
  final RawDatagramSocket _socket;
  final Timer _timer;
  final StreamSubscription<RawSocketEvent> _subscription;

  MulticastSource._(this._socket, this._timer, this._subscription);

  static Future<MulticastSource> create({
    required int port,
    required String group,
    required Handler<Uint8List> handler,
  }) async {
    final socket = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      port,
      reuseAddress: true,
      reusePort: true,
    );

    final subscription = socket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        final datagram = socket.receive();
        if (datagram != null) handler.onData(datagram.data);
      }
    });

    final timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      for (final interface in await _interfaces()) {
        try {
          socket.joinMulticast(InternetAddress(group), interface);
        } catch (_) {}
      }
    });

    return MulticastSource._(socket, timer, subscription);
  }

  @override
  void close() {
    _subscription.cancel();
    _timer.cancel();
    _socket.close();
  }
}

Future<List<NetworkInterface>> _interfaces() {
  return NetworkInterface.list(
    includeLinkLocal: true,
    type: InternetAddressType.IPv4,
    includeLoopback: false,
  );
}
