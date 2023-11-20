import 'package:reacthome/app/features/connection.dart' as c;
import 'package:reacthome/app/features/daemon_connection.dart';
import 'package:reacthome/app/features/discovery.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';

class Connection {
  static final instance = Connection._();

  Connection._();

  ConnectionViewModel connectionViewModelFactory(_) => ConnectionViewModel(
        eventSource: c.Connection.instance.connectionEventBus,
        daemonConnection: (
          query: DaemonConnection.instance.daemonConnectionService,
          actor: DaemonConnection.instance.daemonConnectionService,
        ),
        local: (query: c.Connection.instance.localConnectionService,),
        cloud: (query: c.Connection.instance.cloudConnectionService,),
        daemon: (query: Discovery.instance.daemonService),
      );
}
