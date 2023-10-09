import 'package:flutter/cupertino.dart';
import 'package:reacthome/app/app_factory.dart';
import 'package:reacthome/config.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/screens/home/home_screen_factory.dart';

class DI {
  final Discovery discovery = Discovery(
    group: Config.discovery.group,
    port: Config.discovery.port,
  );

  Widget _homeScreen() => HomeScreenFactory.instance.make(
        discovery: discovery,
        title: 'Home',
      );

  Widget app() => AppFactory.instance.make(
        discovery: discovery,
        homeScreen: _homeScreen(),
      );
}
