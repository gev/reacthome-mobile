import 'package:flutter/widgets.dart';
import 'package:reacthome/make/core/connection_factory.dart';
import 'package:reacthome/make/core/home_connection_factory.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/ui/screens/home_screen.dart';
import 'package:reacthome/ui/view_models/connection_view_model.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';

class HomeScreenFactory {
  HomeScreenFactory._();

  static Future<HomesViewModel> makeHomeViewModel() async => HomesViewModel(
        eventSource: HomeFactory.homeEventBus.stream,
        homeApi: await HomeFactory.makeHomeApi(),
      );

  static Future<ConnectionsViewModel> makeConnectionViewModel() async =>
      ConnectionsViewModel(
        eventSource: ConnectionFactory.connectionEventBus.stream,
        homeConnectionApi: await HomeConnectionFactory.makeHomeConnectionApi(),
        localConnectionApi: ConnectionFactory.makeLocalConnectionApi(),
        cloudConnectionApi: ConnectionFactory.makeCloudConnectionApi(),
        homeApi: await HomeFactory.makeHomeApi(),
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
