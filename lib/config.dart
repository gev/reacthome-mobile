import 'dart:ui';

import 'package:reacthome/app/theme_config.dart';
import 'package:reacthome/domains/discovery/discovery_config.dart';

class Config {
  static const discovery = DiscoveryConfig(
    group: '224.0.0.2',
    port: 2021,
  );
  static const theme = ThemeConfig(
    primaryColor: Color.fromARGB(0xff, 0x4c, 0x7f, 0xe6),
  );
}
