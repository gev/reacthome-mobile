import 'package:reacthome/core/discovery/discovery.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';
import 'package:reacthome/features/discovery/domain/discovery_entity.dart';
import 'package:reacthome/util/bus_emitter.dart';
import 'package:reacthome/util/extensions.dart';

class DiscoveryService<S> extends GenericBusEmitter<DiscoveryEvent>
    implements DiscoveryApi<S> {
  final DiscoveryEntity<S> _process;

  DiscoveryService({
    required super.eventSink,
    required DiscoveryEntity<S> process,
  }) : _process = process;

  @override
  DiscoveryState get state => _process.state;

  @override
  Discovery getProcess() => _process;

  @override
  void start() => _process.start()?.let(emit);

  @override
  void completeStart(S source) => _process.completeStart(source).let(emit);

  @override
  void stop() => _process.stop()?.let(emit);

  @override
  void completeStop() => _process.completeStop()?.let(emit);
}
