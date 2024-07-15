import 'package:flutter/widgets.dart';
import 'package:reacthome/make/application/discovery_factory.dart';
import 'package:reacthome/make/domain/home_factory.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';

class DiscoveryScreenFactory {
  static final instance = DiscoveryScreenFactory._();

  DiscoveryScreenFactory._();

  Future<DiscoveryViewModel> makeDiscoveryViewModel() async =>
      DiscoveryViewModel(
        eventSource: DiscoveryFactory.instance.discoveryEventBus.stream,
        discovery: DiscoveryFactory.instance.makeDiscoveryService(),
        discoveredHome: DiscoveryFactory.instance.makeHomeService(),
        knownHome: await HomeFactory.instance.makeHomeService(),
      );

  HomeViewModel makeHomeViewModel() => HomeViewModel(
        eventSource: DiscoveryFactory.instance.homeEventBus.stream,
        home: DiscoveryFactory.instance.makeHomeService(),
      );

  HomeListViewModel makeHomeListViewModel() => HomeListViewModel(
        eventSource: DiscoveryFactory.instance.homeEventBus.stream,
        home: DiscoveryFactory.instance.makeHomeService(),
      );

  Future<WidgetBuilder> make() async {
    final discoveryViewModel = await makeDiscoveryViewModel();
    return (_) => DiscoveryScreen(
          discoveryViewModel: discoveryViewModel,
          homeViewModel: makeHomeViewModel(),
          homeListViewModel: makeHomeListViewModel(),
        );
  }
}
