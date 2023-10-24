import 'package:reacthome/features/discovery/application/discovery_process_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_entity.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_state.dart';

class DiscoveryProcessRepository implements DiscoveryProcess {
  final DiscoveryProcessEntity _process =
      DiscoveryProcessEntity(DiscoveryProcessState.stopped);

  @override
  DiscoveryProcessEntity get process => _process;
}
