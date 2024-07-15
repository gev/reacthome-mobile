import 'dart:io';

class MulticastConfig {
  final InternetAddress group;
  final int port;
  const MulticastConfig({required this.group, required this.port});
}
