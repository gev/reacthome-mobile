import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_aggregate.dart';

class DiscoveryRepository implements Discovery {
  final DiscoveryAggregate _daemons = DiscoveryAggregate({}, []);

  @override
  DiscoveryAggregate get daemons => _daemons;
}
