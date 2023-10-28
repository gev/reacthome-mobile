import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';

abstract interface class Discovery {
  Iterable<String> getAllDaemons();
  bool hasDaemon(String id);
  DiscoveryDaemon? getDaemon(String id);
  void setDaemon(String id, DiscoveryDaemon daemon);
  void removeDaemon(String id);
}

class DiscoveryService extends SimpleBusEmitter<DiscoveryEvent> {
  final Bus<DiscoveryEvent> eventSink;
  final Discovery repository;

  DiscoveryService({required this.eventSink, required this.repository})
      : super(eventSink);

  Iterable<String> getAllDaemons() => repository.getAllDaemons();

  DiscoveryDaemon? getDaemonById(String id) => repository.getDaemon(id);

  void addDaemon(String id, DiscoveryDaemon daemon) {
    if (!repository.hasDaemon(id)) {
      repository.setDaemon(id, daemon);
      emit(DiscoveryEventDaemonAdded(id));
    } else if (daemon != repository.getDaemon(id)) {
      repository.setDaemon(id, daemon);
      emit(DiscoveryEventDaemonChanged(id));
    }
    emit(DiscoveryEventDaemonConfirmed(id));
  }

  void removeDaemon(String id) {
    if (repository.hasDaemon(id)) {
      repository.removeDaemon(id);
      emit(DiscoveryEventDaemonRemoved(id));
    }
  }
}
