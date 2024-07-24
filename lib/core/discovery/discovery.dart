import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';

class Discovery<S> {
  DiscoveryState state = DiscoveryState.stopped;
  late S _source;

  DiscoveryEvent? start() {
    switch (state) {
      case DiscoveryState.stopped:
        state = DiscoveryState.starPending;
        return const DiscoveryStartRequestedEvent();
      default:
        return null;
    }
  }

  DiscoveryEvent completeStart(S source) {
    switch (state) {
      case DiscoveryState.starPending:
        state = DiscoveryState.running;
        _source = source;
        return const DiscoveryStartCompletedEvent();
      default:
        return DiscoveryRejectedEvent<S>(source);
    }
  }

  DiscoveryEvent? stop() {
    switch (state) {
      case DiscoveryState.starPending:
        state = DiscoveryState.stopped;
        return const DiscoveryStopCompletedEvent();
      case DiscoveryState.running:
        state = DiscoveryState.stopPending;
        return DiscoveryStopRequestedEvent<S>(_source);
      default:
        return null;
    }
  }

  DiscoveryEvent? completeStop() {
    switch (state) {
      case DiscoveryState.stopPending:
        state = DiscoveryState.stopped;
        return const DiscoveryStopCompletedEvent();
      default:
        return null;
    }
  }
}
