import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/features/daemon_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_daemon_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';

class DiscoveryScreenFactory {
  static final instance = DiscoveryScreenFactory._();

  DiscoveryScreenFactory._();

  Widget make(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DiscoveryStatusViewModel(
              eventSource: DiscoveryFactory.instance.discoveryEventBus,
              discovery: DiscoveryFactory.instance.makeDiscoveryService(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => DiscoveryDaemonViewModel(
              context,
              eventSource: DiscoveryFactory.instance.daemonEventBus,
              discoveredDaemon: DiscoveryFactory.instance.makeDaemonService(),
              knownDaemon: DaemonFactory.instance.makeDaemonService(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => DiscoveryDaemonListViewModel(
              eventSource: DiscoveryFactory.instance.daemonEventBus,
              daemon: DiscoveryFactory.instance.makeDaemonService(),
            ),
          ),
        ],
        child: DiscoveryScreen.build(context),
      );
}
