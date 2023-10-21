import 'package:reacthome/infrastructure/multicast/multicast_config.dart';

class DiscoveryConfig {
  final MulticastConfig listen;
  final Duration timeout;

  const DiscoveryConfig({
    required this.listen,
    required this.timeout,
  });
}
