import 'package:flutter/widgets.dart';
import 'package:reacthome/make/core/discovery_factory.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';
import 'package:reacthome/ui/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';

class DiscoveryScreenFactory {
  DiscoveryScreenFactory._();

  static Future<DiscoveryViewModel> makeDiscoveryViewModel() async =>
      DiscoveryViewModel(
        eventSource: DiscoveryFactory.discoveryEventBus.stream,
        discovery: DiscoveryFactory.makeDiscoveryApi(),
        discoveredHome: DiscoveryFactory.makeHomeApi(),
        knownHome: await HomeFactory.makeHomeApi(),
      );

  static HomesViewModel makeHomeViewModel() => HomesViewModel(
        eventSource: DiscoveryFactory.homeEventBus.stream,
        home: DiscoveryFactory.makeHomeApi(),
      );

  static HomeListViewModel makeHomeListViewModel() => HomeListViewModel(
        eventSource: DiscoveryFactory.homeEventBus.stream,
        home: DiscoveryFactory.makeHomeApi(),
      );

  static Future<WidgetBuilder> make() async {
    final discoveryViewModel = await makeDiscoveryViewModel();
    return (_) => DiscoveryScreen(
          discoveryViewModel: discoveryViewModel,
          homeViewModel: makeHomeViewModel(),
          homeListViewModel: makeHomeListViewModel(),
        );
  }
}
