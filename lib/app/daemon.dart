import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/features/daemon/application/daemon_service.dart';
import 'package:reacthome/features/daemon/infrastructure/daemon_repository.dart';
import 'package:reacthome/util/event_bus.dart';

class Daemon {
  static final instance = Daemon._();

  late EventBus<DaemonEvent> daemonEventBus;
  late DaemonService daemonService;

  Daemon._() {
    daemonEventBus = EventBus<DaemonEvent>();

    daemonService = DaemonService(
      eventSink: daemonEventBus,
      repository: DaemonRepository(),
    );
  }
}
