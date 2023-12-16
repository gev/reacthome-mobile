import 'package:reacthome/app/features/connection_factory.dart' as c;
import 'package:reacthome/app/features/daemon_connection_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';

class ConnectionFactory {
  static final instance = ConnectionFactory._();

  ConnectionFactory._();

  ConnectionViewModel make(_) => ConnectionViewModel(
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
