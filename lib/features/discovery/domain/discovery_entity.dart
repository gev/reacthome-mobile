import 'package:reacthome/core/discovery_event.dart';

class DiscoveryEntity {
  final List<String> daemons;

  DiscoveryEntity(this.daemons);

  DiscoveryEvent addDaemon(String daemon) {
    if (!daemons.contains(daemon)) {
      daemons.add(daemon);
      return DiscoveryEventDaemonAdded(daemon);
    }
    return DiscoveryEventDaemonConfirmed(daemon);
  }

  DiscoveryEvent? removeDaemon(String daemon) =>
      daemons.remove(daemon) ? DiscoveryEventDaemonRemoved(daemon) : null;
}
