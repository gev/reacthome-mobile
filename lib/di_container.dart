import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/app_factory.dart';
import 'package:reacthome/app/navigation.dart';
import 'package:reacthome/config.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/screens/home/home_screen_factory.dart';
import 'package:reacthome/screens/home/home_screen_view_model.dart';

class DI {
  Widget app() => AppFactory.instance.make(
        discovery: _discovery,
        navigation: _navigation(),
      );

  final Discovery _discovery = Discovery(
    group: Config.discovery.group,
    port: Config.discovery.port,
  );

  Navigation _navigation() => Navigation(
        home: _homeScreen(),
      );

  Widget _homeScreen() => ChangeNotifierProvider(
        create: (_) => HomeScreenViewModel(_discovery),
        child: HomeScreenFactory.instance.make(
          discovery: _discovery,
          title: 'Home',
        ),
      );
}
