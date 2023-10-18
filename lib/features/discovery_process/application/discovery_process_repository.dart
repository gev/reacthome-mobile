import 'package:reacthome/features/discovery_process/domain/discovery_process_entity.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_state.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryProcessRepository extends BusListener<DiscoveryProcessState> {
  DiscoveryProcessState _state = DiscoveryProcessState.stopped;

  DiscoveryProcessRepository(
      {required Bus<DiscoveryProcessState> commandSource})
      : super(commandSource);

  DiscoveryProcessEntity get state => DiscoveryProcessEntity(_state);

  @override
  void run(DiscoveryProcessState state) => _state = state;
}
