import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_entity.dart';

class DiscoveryRepository implements Discovery {
  final DiscoveryEntity _daemons = DiscoveryEntity([]);

  @override
  DiscoveryEntity get daemons => _daemons;
}
