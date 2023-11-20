import 'package:flutter/widgets.dart';
import 'package:reacthome/app/connection.dart';
import 'package:reacthome/app/daemon.dart';
import 'package:reacthome/app/daemon_connection.dart';
import 'package:reacthome/app/discovery.dart';
import 'package:reacthome/ui/fragments/connection/connection_view_model_factory.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_panel.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_add_view_model_factory.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model_factory.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model_factory.dart';
import 'package:reacthome/ui/fragments/discovery/discovery_status_view_model_factory.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';

class UI {
  static final instance = UI._();

  late final Widget homeScreen;

  UI._() {
    final discoveryStatusViewModelFactory = DiscoveryStatusViewModelFactory(
      eventSource: Discovery.instance.discoveryEventBus,
      query: Discovery.instance.discoveryService,
      actor: Discovery.instance.discoveryService,
    );

    final connectionViewModelFactory = ConnectionViewModelFactory(
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
      daemonListViewModelFactory: DaemonListViewModelFactory(
        eventSource: Daemon.instance.daemonEventBus,
        query: Daemon.instance.daemonService,
      ),
      daemonTileViewModelFactory: DaemonTitleViewModelFactory(
          eventSource: Daemon.instance.daemonEventBus,
          query: Daemon.instance.daemonService),
      daemonAddViewModelFactory: DaemonAddViewModelFactory(
        actor: Daemon.instance.daemonService,
      ),
    );

    Widget right = daemonPanel(
      connectionViewModelFactory: connectionViewModelFactory,
      daemonListViewModelFactory: DaemonListViewModelFactory(
        eventSource: Discovery.instance.daemonEventBus,
        query: Discovery.instance.daemonService,
      ),
      daemonTileViewModelFactory: DaemonTitleViewModelFactory(
          eventSource: Discovery.instance.daemonEventBus,
          query: Discovery.instance.daemonService),
      daemonAddViewModelFactory: DaemonAddViewModelFactory(
        actor: Discovery.instance.daemonService,
      ),
    );

    homeScreen = makeHomeScreen(
      discoveryStatusViewModelFactory: discoveryStatusViewModelFactory,
      left: left,
      right: right,
    );
  }
}
