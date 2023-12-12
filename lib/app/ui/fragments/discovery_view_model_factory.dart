import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';

class DiscoveryViewModelFactory {
  static final instance = DiscoveryViewModelFactory._();

  DiscoveryViewModelFactory._();

  DiscoveryStatusViewModel make(_) => DiscoveryStatusViewModel(
        eventSource: DiscoveryFactory.instance.discoveryEventBus,
        query: DiscoveryFactory.instance.discoveryService,
        actor: DiscoveryFactory.instance.discoveryService,
      );
}
