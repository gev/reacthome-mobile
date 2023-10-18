import 'package:reacthome/features/discovery/discovery_event.dart';

import 'discovery_state.dart';

class DiscoveryEntity {
  final DiscoveryState state;

  DiscoveryEntity(this.state);

  DiscoveryEvent? start() =>
      state == DiscoveryState.stopped ? DiscoveryEvent.start : null;

  DiscoveryEvent? run() =>
      state == DiscoveryState.starting ? DiscoveryEvent.run : null;

  DiscoveryEvent? stop() =>
      state == DiscoveryState.running ? DiscoveryEvent.stop : null;
}
