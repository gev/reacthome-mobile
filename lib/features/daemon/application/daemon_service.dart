import 'dart:io';

import 'package:reacthome/core/daemon/daemon.dart';
import 'package:reacthome/core/daemon/daemon_collection.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/daemon/domain/daemon_entity.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_emitter.dart';

class DaemonService extends EventEmitter<DaemonEvent>
    implements DaemonCommand, DaemonQuery {
  final DaemonCollection repository;

  DaemonService(
      {required EventBus<DaemonEvent> eventSink, required this.repository})
      : super(eventSink);

  @override
  Iterable<String> getAllDaemons() => repository.getAllDaemons();

  @override
  Daemon? getDaemonById(String id) => repository.getDaemon(id);

  @override
  void addDaemon({
    required String id,
    required Meta meta,
    required InternetAddress address,
    String? project,
  }) {
    final daemon = repository.getDaemon(id);
    if (daemon == null) {
      final daemon = DaemonEntity(id, meta, address, project);
      repository.addDaemon(daemon);
      emit(DaemonEventAdded(id));
    } else {
      daemon.update(meta, address, project).forEach(emit);
      emit(DaemonEventConfirmed(id));
    }
  }

  @override
  void removeDaemon({required String id}) {
    if (repository.hasDaemon(id)) {
      repository.removeDaemon(id);
      emit(DaemonEventRemoved(id));
    }
  }
}
