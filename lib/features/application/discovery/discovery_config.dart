import 'package:reacthome/make/config/multicast_config.dart';

class DiscoveryConfig {
  final MulticastConfig listen;
  final Duration renewTimeout;
  final Duration restartTimeout;

  const DiscoveryConfig(
      {required this.listen,
      required this.renewTimeout,
      required this.restartTimeout});
}
