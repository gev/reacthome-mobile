import 'package:reacthome/features/discovery/discovery_event.dart';

import 'discovery_state.dart';

class DiscoveryEntity {
  final DiscoveryState state;

  DiscoveryEntity(this.state);

  DiscoveryEvent? _do({required when, required pure}) =>
      state == when ? pure : null;

  DiscoveryEvent? start() => _do(
        when: DiscoveryState.stopped,
        pure: DiscoveryEvent.start,
      );

  DiscoveryEvent? run() => _do(
        when: DiscoveryState.starting,
        pure: DiscoveryEvent.run,
      );

  DiscoveryEvent? stop() => _do(
        when: DiscoveryState.running,
        pure: DiscoveryEvent.stop,
      );
}
