import 'package:reacthome/app/features/connection_factory.dart' as c;
import 'package:reacthome/app/features/daemon_connection_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';

class ConnectionFactory {
  static final instance = ConnectionFactory._();

  ConnectionFactory._();

  ConnectionViewModel make(_) {
    final daemonConnectionService =
        DaemonConnectionFactory.instance.makeDaemonConnectionService();

    return ConnectionViewModel(
      eventSource: c.ConnectionFactory.instance.connectionEventBus,
      daemonConnection: (
        query: daemonConnectionService,
        actor: daemonConnectionService,
      ),
      local: (
        query: c.ConnectionFactory.instance.makeLocalConnectionService(),
      ),
      cloud: (
        query: c.ConnectionFactory.instance.makeCloudConnectionService(),
      ),
      daemon: (query: DiscoveryFactory.instance.makeDaemonService()),
    );
  }
}
