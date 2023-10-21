import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/features/discovery/domain/discovery_entity.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';
import 'package:reacthome/util/extensions.dart';

abstract interface class Discovery {
  DiscoveryEntity get daemons;
}

class DiscoveryService extends SimpleBusEmitter<DiscoveryEvent> {
  final Bus<DiscoveryEvent> eventSink;
  final Discovery repository;

  DiscoveryService({required this.eventSink, required this.repository})
      : super(eventSink);

  DiscoveryEntity get _daemons => repository.daemons;
  List<String> get daemons => _daemons.daemons;

  void addDaemon(String daemon) {
    final event = _daemons.addDaemon(daemon);
    event.let(emit);
  }

  void removeDaemon(String daemon) {
    final event = _daemons.removeDaemon(daemon);
    event?.let(emit);
  }
}
