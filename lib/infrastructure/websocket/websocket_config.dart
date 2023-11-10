class WebSocketConfig {
  final int localPort;
  final String remoteURL;
  final String protocol;
  const WebSocketConfig({
    required this.remoteURL,
    required this.localPort,
    required this.protocol,
  });
}
