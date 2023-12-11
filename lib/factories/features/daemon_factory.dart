import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/features/daemon/application/daemon_service.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/repository.dart';

class DaemonFactory {
  static final instance = DaemonFactory._();

  late EventBus<DaemonEvent> daemonEventBus;
  late DaemonService daemonService;

  DaemonFactory._() {
    daemonEventBus = GenericEventBus();

    daemonService = DaemonService(
      eventSink: daemonEventBus,
      repository: ImmutableMapRepository(),
    );
  }
}
