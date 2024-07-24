import 'package:flutter/widgets.dart';
import 'package:reacthome/make/core/discovery_factory.dart';
import 'package:reacthome/make/core/home_factory.dart';
import 'package:reacthome/make/core/preferences_factory.dart';
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
        preferredHomeApi: await HomeFactory.makeHomeApi(),
      );

  static Future<HomesViewModel> makeHomeViewModel() async => HomesViewModel(
        eventSource: DiscoveryFactory.homeEventBus.stream,
        preferencesApi: await PreferencesFactory.makePreferencesApi(),
        homeApi: DiscoveryFactory.makeHomeApi(),
      );

  static HomeListViewModel makeHomeListViewModel() => HomeListViewModel(
        eventSource: DiscoveryFactory.homeEventBus.stream,
        homeApi: DiscoveryFactory.makeHomeApi(),
      );

  static Future<WidgetBuilder> make() async {
    final discoveryViewModel = await makeDiscoveryViewModel();
    final homeViewModel = await makeHomeViewModel();
    return (_) => DiscoveryScreen(
          discoveryViewModel: discoveryViewModel,
          homeViewModel: homeViewModel,
          homeListViewModel: makeHomeListViewModel(),
        );
  }
}
