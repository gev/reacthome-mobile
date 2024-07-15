import 'dart:async';
import 'dart:io';

import 'package:reacthome/features/handler.dart';
import 'package:reacthome/make/config/multicast_config.dart';
import 'package:reacthome/util/extensions.dart';

class MulticastSource {
  final RawDatagramSocket _socket;
  final Timer _timer;
  final StreamSubscription<RawSocketEvent> _subscription;

  const MulticastSource._(this._socket, this._timer, this._subscription);

  static Future<MulticastSource> create({
    required MulticastConfig config,
    required Handler<Datagram> controller,
  }) async {
    final socket = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      config.port,
      reuseAddress: true,
      reusePort: true,
    );

    final subscription = socket.listen(
      (RawSocketEvent event) {
        if (event == RawSocketEvent.read) {
          final datagram = socket.receive();
          datagram?.let(controller.handle);
        }
      },
    );

    final timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      for (final interface in await _interfaces()) {
        try {
          socket.joinMulticast(InternetAddress(config.group), interface);
        } catch (_) {}
      }
    });

    return MulticastSource._(socket, timer, subscription);
  }

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
