import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_entity.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_state.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';
import 'package:reacthome/util/extensions.dart';

abstract interface class DiscoveryProcess {
  DiscoveryProcessEntity get process;
  void set(DiscoveryProcessEntity process);
}

class DiscoveryProcessService extends SimpleBusEmitter<DiscoveryProcessEvent> {
  final DiscoveryProcess repository;

  DiscoveryProcessService({
    required Bus<DiscoveryProcessEvent> eventSink,
    required this.repository,
  }) : super(eventSink);

  DiscoveryProcessEntity get _process => repository.process;
  DiscoveryProcessState get state => _process.state;

  void start() async {
    final event = await _process.start(repository.set);
    event?.let(emit);
  }

  void stop() async {
    final event = await _process.stop(repository.set);
    event?.let(emit);
  }
}
