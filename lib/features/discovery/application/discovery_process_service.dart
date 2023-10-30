import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/features/discovery/domain/discovery_process.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_command.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_query.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/extensions.dart';

class DiscoveryProcessService extends EventEmitter<DiscoveryProcessEvent>
    implements DiscoveryProcessCommand, DiscoveryProcessQuery {
  final DiscoveryProcessEntity _process;

  DiscoveryProcessService({
    required EventBus<DiscoveryProcessEvent> eventSink,
    required DiscoveryProcessEntity process,
  })  : _process = process,
        super(eventSink);

  @override
  DiscoveryProcess getProcess() => _process;

  @override
  void start() => _process.start()?.let(emit);

  @override
  void completeStart() => _process.completeStart()?.let(emit);

  @override
  void stop() => _process.stop()?.let(emit);

  @override
  void completeStop() => _process.completeStop()?.let(emit);
}
