class WebSocketConfig {
  final LocalWebSocketConfig local;
  final CloudWebSocketConfig cloud;
  final Duration reconnectTimeout;
  const WebSocketConfig({
    required this.local,
    required this.cloud,
    required this.reconnectTimeout,
  });
}

class LocalWebSocketConfig {
  final int port;
  const LocalWebSocketConfig({
    required this.port,
  });
}

class CloudWebSocketConfig {
  final String url;
  final String protocol;
  const CloudWebSocketConfig({
    required this.url,
    required this.protocol,
  });
}
