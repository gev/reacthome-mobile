import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_entity.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_state.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';

abstract interface class DiscoveryProcess {
  DiscoveryProcessEntity get process;
  void set(DiscoveryProcessState state);
}

class DiscoveryProcessService extends SimpleBusEmitter<DiscoveryProcessEvent> {
  final DiscoveryProcess repository;

  DiscoveryProcessService({
    required Bus<DiscoveryProcessEvent> eventSink,
    required this.repository,
  }) : super(eventSink);

  DiscoveryProcessEntity get _process => repository.process;
  DiscoveryProcessState get state => _process.state;

  void start() => _process.start((nextState) {
        repository.set(nextState);
        emit(DiscoveryProcessEvent.started);
      });
  void stop() => _process.stop((nextState) {
        repository.set(nextState);
        emit(DiscoveryProcessEvent.stopped);
      });
}
