import 'package:flutter/cupertino.dart';
import 'package:reacthome/app/app_factory.dart';
import 'package:reacthome/config.dart';
import 'package:reacthome/features/discovery/discovery.dart';
import 'package:reacthome/features/home/home_factory.dart';

class DI {
  final Discovery discovery = Discovery(
    group: Config.discovery.group,
    port: Config.discovery.port,
  );

  Widget _homePage() => HomeFactory.instance.makeHomePage(discovery: discovery);

  Widget app() =>
      AppFactory.instance.makeApp(discovery: discovery, home: _homePage());
}
