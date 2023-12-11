import 'package:reacthome/factory/features/connection_factory.dart' as c;
import 'package:reacthome/factory/features/daemon_connection_factory.dart';
import 'package:reacthome/factory/features/discovery_factory.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';

class ConnectionFactory {
  static final instance = ConnectionFactory._();

  ConnectionFactory._();

  ConnectionViewModel connectionViewModelFactory(_) => ConnectionViewModel(
        eventSource: c.ConnectionFactory.instance.connectionEventBus,
        daemonConnection: (
          query: DaemonConnectionFactory.instance.daemonConnectionService,
          actor: DaemonConnectionFactory.instance.daemonConnectionService,
        ),
        local: (query: c.ConnectionFactory.instance.localConnectionService,),
        cloud: (query: c.ConnectionFactory.instance.cloudConnectionService,),
        daemon: (query: DiscoveryFactory.instance.daemonService),
      );
}
