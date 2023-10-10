import 'package:flutter/widgets.dart';
import 'package:reacthome/app/app.dart';
import 'package:reacthome/app/navigation.dart';
import 'package:reacthome/config.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final discovery = Discovery(Config.discovery);
  runApp(App.instance.make(
    discovery: discovery,
    navigation: Navigation(
      home: makeHomeScreen(discovery: discovery),
    ),
  ));
}
