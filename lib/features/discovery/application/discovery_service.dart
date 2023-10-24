import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/features/discovery/domain/discovery_aggregate.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';
import 'package:reacthome/util/extensions.dart';

abstract interface class Discovery {
  DiscoveryAggregate get daemons;
}

class DiscoveryService extends SimpleBusEmitter<DiscoveryEvent> {
  final Bus<DiscoveryEvent> eventSink;
  final Discovery repository;

  DiscoveryService({required this.eventSink, required this.repository})
      : super(eventSink);

  DiscoveryAggregate get _daemons => repository.daemons;
  Iterable<String> get daemons => _daemons.daemons;

  DiscoveryDaemon? getDaemonById(String id) => _daemons.getDaemonById(id);

  void addDaemon(String id, DiscoveryDaemon daemon) =>
      _daemons.addDaemon(id, daemon).let(emit);

  void removeDaemon(String daemon) => _daemons.removeDaemon(daemon)?.let(emit);
}
