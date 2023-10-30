import 'dart:io';

import 'package:reacthome/core/discovery_command.dart';
import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';
import 'package:reacthome/util/actor.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/event_bus.dart';

abstract interface class Discovery {
  Iterable<String> getAllDaemons();
  bool hasDaemon(String id);
  DiscoveryDaemonEntity? getDaemon(String id);
  void addDaemon(DiscoveryDaemonEntity daemon);
  void removeDaemon(String id);
}

class DiscoveryService extends EventEmitter<DiscoveryEvent>
    implements Actor<DiscoveryCommand> {
  final EventBus<DiscoveryEvent> eventSink;
  final Discovery repository;

  DiscoveryService({required this.eventSink, required this.repository})
      : super(eventSink);

  Iterable<String> getAllDaemons() => repository.getAllDaemons();

  DiscoveryDaemon? getDaemonById(String id) => repository.getDaemon(id);

  @override
  void execute(DiscoveryCommand command) {
    switch (command) {
      case DiscoveryCommandAddDaemon command:
        _addDaemon(
          id: command.id,
          meta: command.meta,
          address: command.address,
          project: command.project,
        );
      case DiscoveryCommandRemoveDaemon command:
        _removeDaemon(command.id);
      default:
    }
  }

  void _addDaemon({
    required String id,
    required Meta meta,
    required InternetAddress address,
    String? project,
  }) {
    final daemon = repository.getDaemon(id);
    if (daemon == null) {
      final daemon = DiscoveryDaemon.create(id, meta, address, project);
      repository.addDaemon(daemon);
      emit(DiscoveryEventDaemonAdded(id));
    } else {
      daemon.update(meta, address, project).forEach(emit);
      emit(DiscoveryEventDaemonConfirmed(id));
    }
  }

  void _removeDaemon(String id) {
    if (repository.hasDaemon(id)) {
      repository.removeDaemon(id);
      emit(DiscoveryEventDaemonRemoved(id));
    }
  }
}
