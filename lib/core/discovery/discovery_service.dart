import 'package:reacthome/common/emitter.dart';
import 'package:reacthome/core/discovery/discovery.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';
import 'package:reacthome/util/extensions.dart';

class DiscoveryService<S> implements DiscoveryApi<S> {
  final Emitter<DiscoveryEvent> eventSink;
  final Discovery<S> discovery;

  const DiscoveryService({
    required this.eventSink,
    required this.discovery,
  });

  @override
  DiscoveryState get state => discovery.state;

  @override
  Discovery getProcess() => discovery;

  @override
  void start() => discovery.start()?.let(eventSink.emit);

  @override
  void completeStart(S source) =>
      discovery.completeStart(source).let(eventSink.emit);

  @override
  void stop() => discovery.stop()?.let(eventSink.emit);

  @override
  void completeStop() => discovery.completeStop()?.let(eventSink.emit);
}
