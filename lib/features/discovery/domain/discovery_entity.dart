import 'package:reacthome/core/discovery/discovery.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';

class DiscoveryEntity<S> implements Discovery {
  DiscoveryState _state = DiscoveryState.stopped;
  late S _source;

  @override
  DiscoveryState get state => _state;

  DiscoveryEvent? start() {
    switch (_state) {
      case DiscoveryState.stopped:
        _state = DiscoveryState.starPending;
        return DiscoveryStartRequestedEvent();
      default:
        return null;
    }
  }

  DiscoveryEvent completeStart(S source) {
    switch (_state) {
      case DiscoveryState.starPending:
        _state = DiscoveryState.running;
        _source = source;
        return DiscoveryStartCompletedEvent();
      default:
        return DiscoveryRejectedEvent<S>(source);
    }
  }

  DiscoveryEvent? stop() {
    switch (_state) {
      case DiscoveryState.running:
        _state = DiscoveryState.stopPending;
        return DiscoveryStopRequestedEvent<S>(_source);
      default:
        return null;
    }
  }

  DiscoveryEvent? completeStop() {
    switch (_state) {
      case DiscoveryState.stopPending:
        _state = DiscoveryState.stopped;
        return DiscoveryStopCompletedEvent();
      default:
        return null;
    }
  }
}
