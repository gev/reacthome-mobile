import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_state.dart';

class DiscoveryProcessEntity {
  DiscoveryProcessState state;

  DiscoveryProcessEntity(this.state);

  DiscoveryProcessEvent? start() => _run(
        when: DiscoveryProcessState.stopped,
        next: DiscoveryProcessState.starPending,
        emit: DiscoveryProcessEvent.startRequested,
      );

  DiscoveryProcessEvent? completeStart() => _run(
        when: DiscoveryProcessState.starPending,
        next: DiscoveryProcessState.running,
        emit: DiscoveryProcessEvent.started,
      );

  DiscoveryProcessEvent? stop() => _run(
        when: DiscoveryProcessState.running,
        next: DiscoveryProcessState.stopPending,
        emit: DiscoveryProcessEvent.stopRequested,
      );

  DiscoveryProcessEvent? completeStop() => _run(
        when: DiscoveryProcessState.stopPending,
        next: DiscoveryProcessState.stopped,
        emit: DiscoveryProcessEvent.stopped,
      );

  DiscoveryProcessEvent? _run({
    required DiscoveryProcessState when,
    required DiscoveryProcessState next,
    required DiscoveryProcessEvent emit,
  }) {
    if (state == when) {
      state = next;
      return emit;
    }
    return null;
  }
}
