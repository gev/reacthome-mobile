import 'package:flutter/widgets.dart';
import 'package:reacthome/make/features/discovery_factory.dart';
import 'package:reacthome/make/features/home_factory.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';

class DiscoveryScreenFactory {
  DiscoveryScreenFactory._();

  static Future<DiscoveryViewModel> makeDiscoveryViewModel() async =>
      DiscoveryViewModel(
        eventSource: DiscoveryFactory.discoveryEventBus.stream,
        discovery: DiscoveryFactory.makeDiscoveryApi(),
        discoveredHome: DiscoveryFactory.makeHomeApi(),
        knownHome: await HomeFactory.makeHomeApi(),
      );

  static HomeViewModel makeHomeViewModel() => HomeViewModel(
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
