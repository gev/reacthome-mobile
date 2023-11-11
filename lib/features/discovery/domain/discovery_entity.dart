import 'package:reacthome/core/discovery/discovery.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';

class DiscoveryEntity<S> implements Discovery {
  DiscoveryState _state = DiscoveryState.stopped;
  late S _source;

  @override
  DiscoveryState get state => _state;

  DiscoveryEvent? start() {
    if (_state == DiscoveryState.stopped) {
      _state = DiscoveryState.starPending;
      return DiscoveryEventStartRequested();
    }
    return null;
  }

  DiscoveryEvent completeStart(S source) {
    if (_state == DiscoveryState.starPending) {
      _state = DiscoveryState.running;
      _source = source;
      return DiscoveryEventStartCompleted();
    }
    return DiscoveryEventRejected(source);
  }

  DiscoveryEvent? stop() {
    if (_state == DiscoveryState.running) {
      _state = DiscoveryState.stopPending;
      return DiscoveryEventStopRequested(_source);
    }
    return null;
  }

  DiscoveryEvent? completeStop() {
    if (_state == DiscoveryState.stopPending) {
      _state = DiscoveryState.stopped;
      return DiscoveryEventStopCompleted();
    }
    return null;
  }
}
