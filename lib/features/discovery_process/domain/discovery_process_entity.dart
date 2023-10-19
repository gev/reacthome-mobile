import 'discovery_process_state.dart';

class DiscoveryProcessEntity {
  final DiscoveryProcessState state;

  DiscoveryProcessEntity(this.state);

  void start(void Function(DiscoveryProcessState nextState) pure) {
    if (state == DiscoveryProcessState.stopped) {
      pure(DiscoveryProcessState.running);
    }
  }

  void stop(void Function(DiscoveryProcessState nextState) pure) {
    if (state == DiscoveryProcessState.running) {
      pure(DiscoveryProcessState.stopped);
    }
  }
}
