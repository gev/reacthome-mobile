import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:reacthome/domains/discovery/discovery_action.dart';
import 'package:reacthome/domains/discovery/discovery_config.dart';
import 'package:reacthome/domains/providers/data_provider.dart';

class DiscoveryDataProvider extends DataProvider<DiscoveryAction> {
  final DiscoveryConfig config;
  bool started = false;
  late RawDatagramSocket socket;
  late Timer timer;

  DiscoveryDataProvider(this.config);

  void start() async {
    if (!started) {
      started = true;
      socket = await RawDatagramSocket.bind(
          InternetAddress.anyIPv4, config.port,
          reuseAddress: true, reusePort: true);

      timer = Timer.periodic(const Duration(seconds: 1), (_) async {
        for (final interface in await interfaces()) {
          try {
            socket.joinMulticast(InternetAddress(config.group), interface);
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
            add(action);
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
