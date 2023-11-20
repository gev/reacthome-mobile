import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/ui/fragments/Discovery.dart';
import 'package:reacthome/app/ui/fragments/connection.dart';
import 'package:reacthome/app/ui/fragments/daemon_panel.dart';
import 'package:reacthome/ui/screens/home/home_screen.dart';

class Home {
  static final instance = Home._();

  late Widget screen;

  Home._() {
    screen = MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: Discovery.instance.discoveryStatusViewModelFactory,
        ),
        ChangeNotifierProvider(
          create: Connection.instance.connectionViewModelFactory,
        ),
      ],
      child: HomeScreen.make(
        left: DaemonPanel.instance.discoveryPanel,
        right: DaemonPanel.instance.daemonPanel,
      ),
    );
  }
}
