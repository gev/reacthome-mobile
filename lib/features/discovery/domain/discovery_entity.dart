import 'package:reacthome/core/discovery/discovery.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';

class DiscoveryEntity implements Discovery {
  DiscoveryState _state = DiscoveryState.stopped;

  @override
  DiscoveryState get state => _state;

  DiscoveryEvent? start() => _run(
        when: DiscoveryState.stopped,
        next: DiscoveryState.starPending,
        emit: DiscoveryEvent.startRequested,
      );

  DiscoveryEvent? completeStart() => _run(
        when: DiscoveryState.starPending,
        next: DiscoveryState.running,
        emit: DiscoveryEvent.started,
      );

  DiscoveryEvent? stop() => _run(
        when: DiscoveryState.running,
        next: DiscoveryState.stopPending,
        emit: DiscoveryEvent.stopRequested,
      );

  DiscoveryEvent? completeStop() => _run(
        when: DiscoveryState.stopPending,
        next: DiscoveryState.stopped,
        emit: DiscoveryEvent.stopped,
      );

  DiscoveryEvent? _run({
    required DiscoveryState when,
    required DiscoveryState next,
    required DiscoveryEvent emit,
  }) {
    if (_state == when) {
      _state = next;
      return emit;
    }
    return null;
  }
}
