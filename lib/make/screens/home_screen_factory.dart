import 'package:flutter/widgets.dart';
import 'package:reacthome/make/core/connection_factory.dart';
import 'package:reacthome/make/core/home_connection_factory.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/home_screen.dart';

class HomeScreenFactory {
  HomeScreenFactory._();

  static Future<HomeViewModel> makeHomeViewModel() async => HomeViewModel(
        eventSource: HomeFactory.homeEventBus.stream,
        home: await HomeFactory.makeHomeApi(),
      );

  static Future<ConnectionViewModel> makeConnectionViewModel() async =>
      ConnectionViewModel(
        eventSource: ConnectionFactory.connectionEventBus.stream,
        homeConnection: HomeConnectionFactory.makeHomeConnectionApi(),
        local: ConnectionFactory.makeLocalConnectionApi(),
        cloud: ConnectionFactory.makeCloudConnectionApi(),
        home: await HomeFactory.makeHomeApi(),
      );

  static Future<WidgetBuilder> make() async {
    final homeViewModel = await makeHomeViewModel();
    final connectionViewModel = await makeConnectionViewModel();
    return (_) => HomeScreen(
          homeViewModel: homeViewModel,
          connectionViewModel: connectionViewModel,
        );
  }
}
