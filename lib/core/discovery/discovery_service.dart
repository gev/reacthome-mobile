import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/core/discovery/discovery.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_entity.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';
import 'package:reacthome/util/extensions.dart';

class DiscoveryService<S> implements DiscoveryApi<S> {
  final Emitter<DiscoveryEvent> eventSink;
  final DiscoveryEntity<S> _process;

  const DiscoveryService({
    required this.eventSink,
    required DiscoveryEntity<S> process,
  }) : _process = process;

  @override
  DiscoveryState get state => _process.state;

  @override
  Discovery getProcess() => _process;

  @override
  void start() => _process.start()?.let(eventSink.emit);

  @override
  void completeStart(S source) =>
      _process.completeStart(source).let(eventSink.emit);

  @override
  void stop() => _process.stop()?.let(eventSink.emit);

  @override
  void completeStop() => _process.completeStop()?.let(eventSink.emit);
}
