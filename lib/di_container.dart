import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/app.dart';
import 'package:reacthome/app/navigation.dart';
import 'package:reacthome/config.dart';
import 'package:reacthome/domains/discovery/discovery.dart';
import 'package:reacthome/screens/home/home_screen.dart';

class DI {
  Widget app() => AppFactory.instance.make(
        discovery: _discovery,
        navigation: _navigation(),
      );

  final Discovery _discovery = Discovery(Config.discovery);

  Navigation _navigation() => Navigation(
        home: _homeScreen(),
      );

  Widget _homeScreen() => ChangeNotifierProvider(
        create: (_) => HomeScreen.instance.makeViewModel(discovery: _discovery),
        child: HomeScreen.instance.makeView(),
      );
}
