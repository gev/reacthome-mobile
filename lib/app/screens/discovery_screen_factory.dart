import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/ui/fragments/daemon/view_models/daemon_add_view_model.dart';
import 'package:reacthome/ui/fragments/daemon/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';

class DiscoveryScreenFactory {
  static final instance = DiscoveryScreenFactory._();

  DiscoveryScreenFactory._();

  Widget make(BuildContext context) {
    final daemonDiscoveryService =
        DiscoveryFactory.instance.makeDaemonService();
    return MultiProvider(
      providers: [
        Provider(create: (_) => DaemonAddViewModel()),
        ChangeNotifierProvider(
          create: (_) => DiscoveryStatusViewModel(
            eventSource: DiscoveryFactory.instance.discoveryEventBus,
            discovery: DiscoveryFactory.instance.makeDiscoveryService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DaemonListViewModel(
            eventSource: DiscoveryFactory.instance.daemonEventBus,
            daemon: daemonDiscoveryService,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DaemonTitleViewModel(
            eventSource: DiscoveryFactory.instance.daemonEventBus,
            daemon: daemonDiscoveryService,
          ),
        ),
      ],
      child: DiscoveryScreen.build(context),
    );
  }
}
