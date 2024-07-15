import 'package:flutter/widgets.dart';
import 'package:reacthome/make/application/connection_factory.dart';
import 'package:reacthome/make/domain/home_factory.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/home_screen.dart';

class HomeScreenFactory {
  static final instance = HomeScreenFactory._();

  HomeScreenFactory._();

  Future<HomeViewModel> makeHomeViewModel() async => HomeViewModel(
        eventSource: HomeFactory.instance.homeEventBus.stream,
        home: await HomeFactory.instance.makeHomeService(),
      );

  Future<WidgetBuilder> make() async {
    final homeViewModel = await makeHomeViewModel();
    final connectionViewModel =
        await ConnectionFactory.instance.makeConnectionViewModel();
    return (_) => HomeScreen(
          homeViewModel: homeViewModel,
          connectionViewModel: connectionViewModel,
        );
  }
}
