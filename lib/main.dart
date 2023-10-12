import 'package:flutter/widgets.dart';
import 'package:reacthome/app/app.dart';
import 'package:reacthome/app/navigation.dart';
import 'package:reacthome/config.dart';
import 'package:reacthome/domains/discovery/discovery_data_provider.dart';
import 'package:reacthome/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final discovery = DiscoveryDataProvider(Config.discovery);
  runApp(makeApp(
    theme: Config.theme,
    discovery: discovery,
    navigation: Navigation(
      home: makeHomeScreen(discovery: discovery),
    ),
  ));
}
