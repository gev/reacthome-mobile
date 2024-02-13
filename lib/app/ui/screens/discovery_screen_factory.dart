import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/app/ui/fragments/discovery_view_model_factory.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';

class DiscoveryScreenFactory {
  static final instance = DiscoveryScreenFactory._();

  DiscoveryScreenFactory._();

  Widget make(BuildContext context) {
    final daemonDiscoveryService =
        DiscoveryFactory.instance.makeDaemonService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: DiscoveryViewModelFactory.instance.make,
        ),
        ChangeNotifierProvider(
            create: (_) => DaemonListViewModel(
                  eventSource: DiscoveryFactory.instance.daemonEventBus,
                  query: daemonDiscoveryService,
                )),
        ChangeNotifierProvider(
            create: (_) => DaemonTitleViewModel(
                  eventSource: DiscoveryFactory.instance.daemonEventBus,
                  query: daemonDiscoveryService,
                )),
      ],
      child: DiscoveryScreen.build(context),
    );
  }
}
