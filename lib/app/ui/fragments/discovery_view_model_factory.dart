import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';

class DiscoveryViewModelFactory {
  static final instance = DiscoveryViewModelFactory._();

  DiscoveryViewModelFactory._();

  DiscoveryStatusViewModel make(_) {
    final discoveryService = DiscoveryFactory.instance.makeDiscoveryService();
    return DiscoveryStatusViewModel(
      eventSource: DiscoveryFactory.instance.discoveryEventBus,
      query: discoveryService,
      actor: discoveryService,
    );
  }
}
