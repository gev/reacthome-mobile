import 'package:reacthome/core/discovery_process_event.dart';

import 'discovery_process_state.dart';

class DiscoveryProcessEntity {
  DiscoveryProcessState state;

  DiscoveryProcessEntity(this.state);

  Future<DiscoveryProcessEvent?> start(
      Function(DiscoveryProcessEntity) startProcess) async {
    if (state == DiscoveryProcessState.stopped) {
      state = DiscoveryProcessState.starting;
      await startProcess(this);
      state = DiscoveryProcessState.running;
      return DiscoveryProcessEvent.started;
    }
    return null;
  }

  Future<DiscoveryProcessEvent?> stop(
      Function(DiscoveryProcessEntity) stopProcess) async {
    if (state == DiscoveryProcessState.running) {
      await stopProcess(this);
      state = DiscoveryProcessState.stopped;
      return DiscoveryProcessEvent.stopped;
    }
    return null;
  }
}
