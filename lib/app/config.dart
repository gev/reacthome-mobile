import 'dart:ui';

import 'package:reacthome/features/discovery/discovery_config.dart';
import 'package:reacthome/infrastructure/multicast/multicast_config.dart';
import 'package:reacthome/infrastructure/websocket/websocket_config.dart';
import 'package:reacthome/ui/theme_config.dart';

class Config {
  static const connection = WebSocketConfig(
    local: LocalWebSocketConfig(port: 3000),
    cloud: CloudWebSocketConfig(
      url: 'gate.reacthome.net',
      protocol: 'connect',
    ),
  );

  static const discovery = DiscoveryConfig(
    listen: MulticastConfig(
      group: '224.0.0.2',
      port: 2021,
    ),
    timeout: Duration(seconds: 15),
  );

  static const theme = ThemeConfig(
    primaryColor: Color.fromARGB(0xff, 0x4c, 0x7f, 0xe6),
  );
}
