import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:reacthome/features/discovery/discovery_action.dart';

class Discovery {
  final String group;
  final int port;
  bool started = false;
  late RawDatagramSocket socket;
  late Timer timer;

  final StreamController<DiscoveryAction> _controller =
      StreamController.broadcast();

  Stream<DiscoveryAction> get stream => _controller.stream;

  Discovery({required this.group, required this.port});

  void start() async {
    if (!started) {
      started = true;
      socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, port,
          reuseAddress: true, reusePort: true);

      timer = Timer.periodic(const Duration(seconds: 1), (_) async {
        for (final interface in await interfaces()) {
          try {
            socket.joinMulticast(InternetAddress(group), interface);
          } catch (_) {}
        }
      });

      socket.listen(_handle);
    }
  }

  stop() {
    if (started) {
      timer.cancel();
      socket.close();
      started = false;
    }
  }

  _handle(event) {
    if (event == RawSocketEvent.read) {
      final datagram = socket.receive();
      if (datagram != null) {
        final message = utf8.decode(datagram.data);
        try {
          final json = jsonDecode(message);
          final type = json['type'];
          if (type == discovery) {
            final action = DiscoveryAction.fromJSON(json);
            _controller.add(action);
          }
        } catch (_) {
          // ToDo: Handle errors
        }
      }
    }
  }

  void dispose() {
    stop();
  }
}

Future<List<NetworkInterface>> interfaces() {
  return NetworkInterface.list(
    includeLinkLocal: true,
    type: InternetAddressType.IPv4,
    includeLoopback: false,
  );
}
