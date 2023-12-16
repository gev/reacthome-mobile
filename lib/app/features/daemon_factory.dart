import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/features/daemon/application/daemon_service.dart';
import 'package:reacthome/features/daemon/domain/daemon_entity.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/repository.dart';

class DaemonFactory {
  static final instance = DaemonFactory._();

  DaemonFactory._();

  final _repository = ImmutableMapRepository<String, DaemonEntity>();

  final daemonEventBus = GenericEventBus<DaemonEvent>();

  DaemonService makeDaemonService() => DaemonService(
        eventSink: daemonEventBus,
        repository: _repository,
      );
}
