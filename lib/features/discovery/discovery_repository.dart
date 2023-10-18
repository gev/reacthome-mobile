import 'package:reacthome/features/discovery/discovery_entity.dart';
import 'package:reacthome/features/discovery/discovery_state.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';

class DiscoveryRepository extends BusListener<DiscoveryState> {
  DiscoveryState _state = DiscoveryState.stopped;

  DiscoveryRepository({required Bus<DiscoveryState> commandSource})
      : super(commandSource);

  DiscoveryEntity get state => DiscoveryEntity(_state);

  @override
  void run(DiscoveryState state) => _state = state;
}
