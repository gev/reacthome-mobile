import 'package:flutter/widgets.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';

class DiscoveryScreenFactory {
  static final instance = DiscoveryScreenFactory._();

  DiscoveryScreenFactory._();

  DiscoveryViewModel makeDiscoveryStatusViewModel() => DiscoveryViewModel(
        eventSource: DiscoveryFactory.instance.discoveryEventBus.stream,
        discovery: DiscoveryFactory.instance.makeDiscoveryService(),
        discoveredHome: DiscoveryFactory.instance.makeHomeService(),
        knownHome: HomeFactory.instance.makeHomeService(),
      );

  HomeViewModel makeHomeViewModel() => HomeViewModel(
        eventSource: DiscoveryFactory.instance.homeEventBus.stream,
        home: DiscoveryFactory.instance.makeHomeService(),
      );

  HomeListViewModel makeHomeListViewModel() => HomeListViewModel(
        eventSource: DiscoveryFactory.instance.homeEventBus.stream,
        home: DiscoveryFactory.instance.makeHomeService(),
      );

  Widget make(_) => DiscoveryScreen(
        discoveryViewModel: makeDiscoveryStatusViewModel(),
        homeViewModel: makeHomeViewModel(),
        homeListViewModel: makeHomeListViewModel(),
      );
}
