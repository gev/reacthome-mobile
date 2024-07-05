import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/app/features/home_factory.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_list_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';
import 'package:reacthome/ui/screens/discovery_screen.dart';

class DiscoveryScreenFactory {
  static final instance = DiscoveryScreenFactory._();

  DiscoveryScreenFactory._();

  Widget make(_) => MultiProvider(
        providers: [
          Provider(
            create: (_) => DiscoveryStatusViewModel(
              eventSource: DiscoveryFactory.instance.discoveryEventBus.stream,
              discovery: DiscoveryFactory.instance.makeDiscoveryService(),
            ),
          ),
          Provider(
            create: (context) => DiscoveryHomeViewModel(
              context,
              eventSource: DiscoveryFactory.instance.homeEventBus.stream,
              discoveredHome: DiscoveryFactory.instance.makeHomeService(),
              knownHome: HomeFactory.instance.makeHomeService(),
            ),
          ),
          Provider(
            create: (_) => DiscoveryHomeListViewModel(
              eventSource: DiscoveryFactory.instance.homeEventBus.stream,
              home: DiscoveryFactory.instance.makeHomeService(),
            ),
          ),
        ],
        child: const DiscoveryScreen(),
      );
}
