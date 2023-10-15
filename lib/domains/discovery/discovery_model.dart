import 'package:reacthome/domains/discovery/discovery_event.dart';

import 'discovery_state.dart';

class DiscoveryModel {
  int _counter = 0;
  DiscoveryState _state = DiscoveryState.stopped;

  DiscoveryModel();

  int get counter => _counter;
  DiscoveryState get state => _state;

  void start(void Function(DiscoveryEvent) emit) {
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

  void stop(void Function(DiscoveryEvent) emit) {
    if (_state == DiscoveryState.running) {
      _state = DiscoveryState.stopped;
      emit(const DiscoveryEventStop());
    }
  }

  void increment(void Function(DiscoveryEvent) emit) {
    _counter++;
    emit(DiscoveryEventCounterChanged(_counter));
  }
}
