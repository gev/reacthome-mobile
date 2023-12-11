import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/factory/ui/fragments/Discovery.dart';
import 'package:reacthome/factory/ui/fragments/connection_factory.dart';
import 'package:reacthome/factory/ui/fragments/daemon_panel_factory.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';

class HomeScreenFactory {
  static final instance = HomeScreenFactory._();

  late Widget screen;

  HomeScreenFactory._() {
    screen = MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: Discovery.instance.discoveryStatusViewModelFactory,
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
