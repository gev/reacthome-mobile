import 'package:reacthome/features/discovery_process/domain/discovery_process_entity.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_event.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_state.dart';
import 'package:reacthome/features/discovery_process/infrastructure/discovery_process_repository.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';
import 'package:reacthome/util/extensions.dart';

class DiscoveryProcessService extends SimpleBusEmitter<DiscoveryProcessEvent> {
  final DiscoveryProcessRepository repository;

  DiscoveryProcessService(this.repository,
      {required Bus<DiscoveryProcessEvent> eventSink})
      : super(eventSink);

  DiscoveryProcessEntity get _process => repository.process;
  DiscoveryProcessState get state => _process.state;

  void start() => _process.start()?.let(emit);
  void run() => _process.run()?.let(emit);
  void stop() => _process.stop()?.let(emit);
}
