class WebSocketConfig {
  final int localPort;
  final String cloudURL;
  final String protocol;
  const WebSocketConfig({
    required this.cloudURL,
    required this.localPort,
    required this.protocol,
  });
}
