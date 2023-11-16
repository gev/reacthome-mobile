import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/ui/fragments/connection/connection_vew_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_panel_view.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_view_model.dart';
import 'package:reacthome/util/event_bus.dart';

Widget daemonPanel({
  required ({
    EventBus<ConnectionEvent> eventBus,
  }) connection,
  required ({
    ConnectionQuery<DaemonConnection> query,
    DaemonConnectionCommand actor,
  }) daemonConnection,
  required ({
    ConnectionQuery<Connection> query,
  }) local,
  required ({
    ConnectionQuery<Connection> query,
  }) cloud,
  required ({
    EventBus<DaemonEvent> eventBus,
    DaemonQuery query,
    DaemonCommand actor,
  }) daemon,
}) {
  connectionViewModel(_) => ConnectionViewModel(
        eventSource: connection.eventBus,
        daemonConnection: daemonConnection,
        local: local,
        cloud: cloud,
        daemon: (query: daemon.query),
      );
  daemonListViewModel(_) => DaemonListViewModel(
        daemon.query,
        eventSource: daemon.eventBus,
      );
  daemonTileViewModel(_) => DaemonTitleViewModel(
        daemon.query,
        eventSource: daemon.eventBus,
      );
  addButtonViewModel(_) => DaemonViewModel(
        daemon.actor,
      );
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: connectionViewModel),
      ChangeNotifierProvider(create: daemonListViewModel),
      ChangeNotifierProvider(create: daemonTileViewModel),
      ChangeNotifierProvider(create: addButtonViewModel),
    ],
    child: const DaemonPanelView(),
  );
}
