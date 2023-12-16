import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/ui/fragments/connection_factory.dart';
import 'package:reacthome/app/ui/fragments/daemon_panel_factory.dart';
import 'package:reacthome/app/ui/fragments/discovery_view_model_factory.dart';
import 'package:reacthome/ui/screens/home_screen.dart';

class HomeScreenFactory {
  static final instance = HomeScreenFactory._();

  late Widget screen;

  HomeScreenFactory._() {
    screen = MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: DiscoveryViewModelFactory.instance.make,
        ),
        ChangeNotifierProvider(
          create: ConnectionFactory.instance.connectionViewModelFactory,
        ),
      ],
      child: HomeScreen.make(
        left: DaemonPanelFactory.instance.discoveryPanel,
        right: DaemonPanelFactory.instance.daemonPanel,
      ),
    );
  }
}
