import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_state.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';

class DiscoveryProcessService extends SimpleBusEmitter<DiscoveryProcessEvent> {
  DiscoveryProcessState _state = DiscoveryProcessState.stopped;

  DiscoveryProcessService({
    required Bus<DiscoveryProcessEvent> eventSink,
  }) : super(eventSink);

  DiscoveryProcessState get state => _state;

  void start() => _run(
        when: DiscoveryProcessState.stopped,
        next: DiscoveryProcessState.starPending,
        event: DiscoveryProcessEvent.startRequested,
      );

  void completeStart() => _run(
        when: DiscoveryProcessState.starPending,
        next: DiscoveryProcessState.running,
        event: DiscoveryProcessEvent.started,
      );

  void stop() => _run(
        when: DiscoveryProcessState.running,
        next: DiscoveryProcessState.stopPending,
        event: DiscoveryProcessEvent.stopRequested,
      );

  void completeStop() => _run(
        when: DiscoveryProcessState.stopPending,
        next: DiscoveryProcessState.stopped,
        event: DiscoveryProcessEvent.stopped,
      );

  void _run({
    required DiscoveryProcessState when,
    required DiscoveryProcessState next,
    required DiscoveryProcessEvent event,
  }) {
    if (_state == when) {
      _state = next;
      emit(event);
    }
  }
}
