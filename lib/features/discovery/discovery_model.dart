import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/util/event_emitter.dart';

import 'discovery_state.dart';

class DiscoveryModel extends EventEmitter {
  int _counter = 0;
  DiscoveryState _state = DiscoveryState.stopped;

  DiscoveryModel(super.eventBus);

  int get counter => _counter;
  DiscoveryState get state => _state;

  void start() {
    if (_state == DiscoveryState.stopped) {
      _state = DiscoveryState.starting;
      emit(const DiscoveryEventStart());
    }
  }

  void run() {
    if (_state == DiscoveryState.starting) {
      _state = DiscoveryState.running;
    }
  }

  void stop() {
    if (_state == DiscoveryState.running) {
      _state = DiscoveryState.stopped;
      emit(const DiscoveryEventStop());
    }
  }

  void increment() {
    _counter++;
    emit(DiscoveryEventCounterChanged(_counter));
  }
}
