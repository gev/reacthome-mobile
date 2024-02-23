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
          ChangeNotifierProvider(
            create: (_) => DiscoveryStatusViewModel(
              eventSource: DiscoveryFactory.instance.discoveryEventBus,
              discovery: DiscoveryFactory.instance.makeDiscoveryService(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => DiscoveryHomeViewModel(
              context,
              eventSource: DiscoveryFactory.instance.homeEventBus,
              discoveredHome: DiscoveryFactory.instance.makeHomeService(),
              knownHome: HomeFactory.instance.makeHomeService(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => DiscoveryHomeListViewModel(
              eventSource: DiscoveryFactory.instance.homeEventBus,
              home: DiscoveryFactory.instance.makeHomeService(),
            ),
          ),
        ],
        child: const DiscoveryScreen(),
      );
}
