import 'package:reacthome/features/discovery_process/domain/discovery_process_event.dart';

import 'discovery_process_state.dart';

class DiscoveryProcessEntity {
  final DiscoveryProcessState state;

  DiscoveryProcessEntity(this.state);

  DiscoveryProcessEvent? _do({required when, required pure}) =>
      state == when ? pure : null;

  DiscoveryProcessEvent? start() => _do(
        when: DiscoveryProcessState.stopped,
        pure: DiscoveryProcessEvent.start,
      );

  DiscoveryProcessEvent? run() => _do(
        when: DiscoveryProcessState.starting,
        pure: DiscoveryProcessEvent.run,
      );

  DiscoveryProcessEvent? stop() => _do(
        when: DiscoveryProcessState.running,
        pure: DiscoveryProcessEvent.stop,
      );
}
