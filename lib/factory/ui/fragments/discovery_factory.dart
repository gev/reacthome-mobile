import 'package:reacthome/factory/features/discovery_factory.dart' as d;
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';

class DiscoveryFactory {
  static final instance = DiscoveryFactory._();

  DiscoveryFactory._();

  DiscoveryStatusViewModel discoveryStatusViewModelFactory(_) =>
      DiscoveryStatusViewModel(
        eventSource: d.DiscoveryFactory.instance.discoveryEventBus,
        query: d.DiscoveryFactory.instance.discoveryService,
        actor: d.DiscoveryFactory.instance.discoveryService,
      );
}
