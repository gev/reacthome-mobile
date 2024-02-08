import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/ui/fragments/connection_factory.dart';
import 'package:reacthome/app/ui/fragments/daemon_panel_factory.dart';
import 'package:reacthome/app/ui/fragments/discovery_view_model_factory.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';

class DiscoveryScreenFactory {
  static final instance = DiscoveryScreenFactory._();

  DiscoveryScreenFactory._();

  Widget make(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: DiscoveryViewModelFactory.instance.make,
          ),
          ChangeNotifierProvider(
            create: ConnectionFactory.instance.make,
          ),
        ],
        child: DiscoveryScreen.make(
          discoveryPanel: DaemonPanelFactory.instance.makeDiscoveryPanel(),
        ),
      );
}
