import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/features/daemon/application/daemon_service.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/repository.dart';

class Daemon {
  static final instance = Daemon._();

  late EventBus<DaemonEvent> daemonEventBus;
  late DaemonService daemonService;

  Daemon._() {
    daemonEventBus = EventBus();

    daemonService = DaemonService(
      eventSink: daemonEventBus,
      repository: ImmutableMapRepository(),
    );
  }
}
