import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/connection.dart';
import 'package:reacthome/app/daemon.dart';
import 'package:reacthome/app/daemon_connection.dart';
import 'package:reacthome/app/discovery.dart';
import 'package:reacthome/app/ui/fragments/daemon_panel/daemon_panel.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_add_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';

Widget makeHomeScreen() {
  discoveryStatusViewModelFactory(_) => DiscoveryStatusViewModel(
        eventSource: Discovery.instance.discoveryEventBus,
        query: Discovery.instance.discoveryService,
        actor: Discovery.instance.discoveryService,
      );

  connectionViewModelFactory(_) => ConnectionViewModel(
        eventSource: Connection.instance.connectionEventBus,
        daemonConnection: (
          query: DaemonConnection.instance.daemonConnectionService,
          actor: DaemonConnection.instance.daemonConnectionService,
        ),
        local: (query: Connection.instance.localConnectionService,),
        cloud: (query: Connection.instance.cloudConnectionService,),
        daemon: (query: Discovery.instance.daemonService),
      );

  Widget left = daemonPanel(
    connectionViewModelFactory: connectionViewModelFactory,
    daemonListViewModelFactory: (_) => DaemonListViewModel(
      eventSource: Discovery.instance.daemonEventBus,
      query: Discovery.instance.daemonService,
    ),
    daemonTileViewModelFactory: (_) => DaemonTitleViewModel(
        eventSource: Discovery.instance.daemonEventBus,
        query: Discovery.instance.daemonService),
    daemonAddViewModelFactory: (_) => DaemonAddViewModel(
      actor: Discovery.instance.daemonService,
    ),
  );

  Widget right = daemonPanel(
    connectionViewModelFactory: connectionViewModelFactory,
    daemonListViewModelFactory: (_) => DaemonListViewModel(
      eventSource: Daemon.instance.daemonEventBus,
      query: Daemon.instance.daemonService,
    ),
    daemonTileViewModelFactory: (_) => DaemonTitleViewModel(
        eventSource: Daemon.instance.daemonEventBus,
        query: Daemon.instance.daemonService),
    daemonAddViewModelFactory: (_) => DaemonAddViewModel(
      actor: Daemon.instance.daemonService,
    ),
  );

  return ChangeNotifierProvider(
    create: discoveryStatusViewModelFactory,
    child: HomeScreen.make(
      left: left,
      right: right,
    ),
  );
}
