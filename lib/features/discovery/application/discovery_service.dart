import 'package:reacthome/core/discovery/discovery.dart';
import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_query.dart';
import 'package:reacthome/features/discovery/domain/discovery_entity.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/extensions.dart';

class DiscoveryService extends EventEmitter<DiscoveryEvent>
    implements DiscoveryCommand, DiscoveryQuery {
  final DiscoveryEntity _process;

  DiscoveryService({
    required super.eventSink,
    required DiscoveryEntity process,
  }) : _process = process;

  @override
  Discovery getProcess() => _process;

  @override
  void start() => _process.start()?.let(emit);

  @override
  void completeStart<S>(S source) => _process.completeStart(source).let(emit);

  @override
  void stop() => _process.stop()?.let(emit);

  @override
  void completeStop() => _process.completeStop()?.let(emit);
}
