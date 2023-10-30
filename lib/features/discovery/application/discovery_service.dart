import 'dart:io';

import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_daemon.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_query.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/application/discovery_collection.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon_entity.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_emitter.dart';

class DiscoveryService extends EventEmitter<DiscoveryEvent>
    implements DiscoveryCommand, DiscoveryQuery {
  final EventBus<DiscoveryEvent> eventSink;
  final DiscoveryCollection repository;

  DiscoveryService({required this.eventSink, required this.repository})
      : super(eventSink);

  @override
  Iterable<String> getAllDaemons() => repository.getAllDaemons();

  @override
  DiscoveryDaemon? getDaemonById(String id) => repository.getDaemon(id);

  @override
  void addDaemon({
    required String id,
    required Meta meta,
    required InternetAddress address,
    String? project,
  }) {
    final daemon = repository.getDaemon(id);
    if (daemon == null) {
      final daemon = DiscoveryDaemonEntity(id, meta, address, project);
      repository.addDaemon(daemon);
      emit(DiscoveryEventDaemonAdded(id));
    } else {
      daemon.update(meta, address, project).forEach(emit);
      emit(DiscoveryEventDaemonConfirmed(id));
    }
  }

  @override
  void removeDaemon({required String id}) {
    if (repository.hasDaemon(id)) {
      repository.removeDaemon(id);
      emit(DiscoveryEventDaemonRemoved(id));
    }
  }
}
