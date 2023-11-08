import 'dart:io';

import 'package:reacthome/core/daemon/daemon.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/daemon/domain/daemon_entity.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/repository.dart';

class DaemonService extends EventEmitter<DaemonEvent>
    implements DaemonCommand, DaemonQuery {
  final Repository<String, DaemonEntity> repository;

  DaemonService(
      {required EventBus<DaemonEvent> eventSink, required this.repository})
      : super(eventSink);

  @override
  Iterable<String> getAllDaemons() => repository.getAll();

  @override
  Daemon? getDaemonById(String id) => repository.get(id);

  @override
  void addDaemon({
    required String id,
    required Meta meta,
    required InternetAddress address,
    String? project,
  }) {
    final daemon = repository.get(id);
    if (daemon == null) {
      final daemon = DaemonEntity(id, meta, address, project);
      repository.add(daemon);
      emit(DaemonEventAdded(id));
    } else {
      daemon.update(meta, address, project).forEach(emit);
      emit(DaemonEventConfirmed(id));
    }
  }

  @override
  void removeDaemon({required String id}) {
    if (repository.has(id)) {
      repository.remove(id);
      emit(DaemonEventRemoved(id));
    }
  }
}
