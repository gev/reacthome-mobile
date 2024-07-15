import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:reacthome/make/config/discovery_config.dart';
import 'package:reacthome/make/config/multicast_config.dart';
import 'package:reacthome/make/config/theme_config.dart';
import 'package:reacthome/make/config/websocket_config.dart';

class Config {
  static const connection = WebSocketConfig(
    local: LocalWebSocketConfig(port: 3000),
    cloud: CloudWebSocketConfig(
      url: 'gate.reacthome.net',
      protocol: 'connect',
    ),
    reconnectTimeout: Duration(seconds: 5),
  );

  static final discovery = DiscoveryConfig(
    listen: MulticastConfig(
      group: InternetAddress('224.0.0.2', type: InternetAddressType.IPv4),
      port: 2021,
    ),
    renewTimeout: const Duration(seconds: 15),
    restartTimeout: const Duration(seconds: 5),
  );

  static const theme = ThemeConfig(
    seedColor: Color.fromARGB(0xff, 0x00, 0x59, 0xff),
    iconGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(0xff, 0x00, 0x59, 0xff),
        Color.fromARGB(0xff, 0x00, 0xff, 0xb1),
      ],
    ),
  );

  static get getApplicationDocumentsDirectory => null;
}
