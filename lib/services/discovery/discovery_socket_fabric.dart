import 'dart:async';
import 'dart:io';

import 'package:reacthome/services/discovery/discovery_config.dart';
import 'package:reacthome/services/discovery/discovery_socket_controller.dart';

class DiscoverySocketFabric {
  final DiscoveryConfig config;
  final DiscoverySocketController controller;

  DiscoverySocketFabric(this.config, this.controller);

  Future<DiscoverySocket> create() async {
    final socket = await RawDatagramSocket.bind(
      InternetAddress.anyIPv4,
      config.port,
      reuseAddress: true,
      reusePort: true,
    );

    final subscription = socket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        final datagram = socket.receive();
        if (datagram != null) controller.handle(datagram.data);
      }
    });

    final timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      for (final interface in await _interfaces()) {
        try {
          socket.joinMulticast(InternetAddress(config.group), interface);
        } catch (_) {}
      }
    });

    return DiscoverySocket._(socket, timer, subscription);
  }
}

class DiscoverySocket {
  final RawDatagramSocket _socket;
  final Timer _timer;
  final StreamSubscription<RawSocketEvent> _subscription;

  DiscoverySocket._(this._socket, this._timer, this._subscription);

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
