import 'package:reacthome/core/discovery_process_command.dart';
import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/core/discovery_query.dart';
import 'package:reacthome/features/discovery/domain/discovery_process.dart';
import 'package:reacthome/util/actor.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/extensions.dart';
import 'package:reacthome/util/query.dart';

class DiscoveryProcessService extends EventEmitter<DiscoveryProcessEvent>
    implements Actor<DiscoveryProcessCommand> implements Query<DiscoveryQuery> {
  final DiscoveryProcessEntity _process;

  DiscoveryProcessService({
    required EventBus<DiscoveryProcessEvent> eventSink,
    required DiscoveryProcessEntity process,
  })  : _process = process,
        super(eventSink);

  DiscoveryProcess get process => _process;

  @override
  void execute(DiscoveryProcessCommand command) {
    switch (command) {
      case DiscoveryProcessCommand.start:
        _startProcess();
      case DiscoveryProcessCommand.completeStart:
        _completeStartProcess();
      case DiscoveryProcessCommand.stop:
        _stopProcess();
      case DiscoveryProcessCommand.completeStop:
        _completeStopProcess();
    }
  }

  void _startProcess() => _process.start()?.let(emit);

  void _completeStartProcess() => _process.completeStart()?.let(emit);

  void _stopProcess() => _process.stop()?.let(emit);

  void _completeStopProcess() => _process.completeStop()?.let(emit);
}
