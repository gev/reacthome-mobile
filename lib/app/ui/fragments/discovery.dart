import 'package:reacthome/app/features/discovery.dart' as d;
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';

class Discovery {
  static final instance = Discovery._();

  Discovery._();

  DiscoveryStatusViewModel discoveryStatusViewModelFactory(_) =>
      DiscoveryStatusViewModel(
        eventSource: d.Discovery.instance.discoveryEventBus,
        query: d.Discovery.instance.discoveryService,
        actor: d.Discovery.instance.discoveryService,
      );
}
