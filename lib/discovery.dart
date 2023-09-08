import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

Future<List<NetworkInterface>> interfaces() {
  return NetworkInterface.list(
    includeLinkLocal: true,
    type: InternetAddressType.IPv4,
    includeLoopback: false,
  );
}

void startDiscovery(String group, int port) async {
  final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, port,
      reuseAddress: true, reusePort: true);
  Timer.periodic(const Duration(seconds: 1), (_) async {
    for (final interface in await interfaces()) {
      try {
        socket.joinMulticast(InternetAddress(group), interface);
      } catch (_) {}
    }
  });
  socket.listen((event) {
    switch (event) {
      case RawSocketEvent.read:
        final datagram = socket.receive();
        if (datagram != null) log(utf8.decode(datagram.data));
        break;
      case RawSocketEvent.write:
        break;
      case RawSocketEvent.readClosed:
        break;
      case RawSocketEvent.closed:
        break;
    }
  });
}
